const pool = require("../configs/db")
const {DatabaseError, ValidationError, AuthenticationError, NotFoundError} = require("../utils/custom.error")
const EncryptionService = require("../Utils/encryption.utils")
const bcrypt = require("bcrypt")
const { StandardEmailRegex } = require("../utils/custom.regex")
const uuid = require("uuid")
require("dotenv").config()

class AuthRepository {
    SelectUserByUsername = async(data) => {
        const connection = await pool.getConnection(); // Get a connection from the pool
        try {
            const SQL_UID = {
                SQL_QUERY: 'SELECT user_id FROM user WHERE username = ?',
                VALUE: [data.username]
            }
            const SQL_USER = {
                SQL_QUERY: 'SELECT username FROM user WHERE username = ?',
                VALUE: [data.username]
            }
            const SQL_PWD = {
                SQL_QUERY: 'SELECT pwd FROM user WHERE username = ?',
                VALUE: [data.username]
            }
            const useIdReponse = await connection.query(SQL_UID.SQL_QUERY,SQL_UID.VALUE)
            const usernameResponse = await connection.query(SQL_USER.SQL_QUERY,SQL_USER.VALUE)
            const passwordResponse = await connection.query(SQL_PWD.SQL_QUERY,SQL_PWD.VALUE)

            if (usernameResponse[0].length == 0) {
                throw new NotFoundError("User Not Found in our System")
            }
            
            const hashedPassword = passwordResponse[0][0].pwd
            const username = usernameResponse[0][0].username
            const user_id = useIdReponse[0][0].user_id

            return {hashedPassword,username,user_id}
        } catch (err) {
            if (err instanceof NotFoundError) {
                throw err; // Re-throw ValidationError to be handled in the service layer
            }
            throw new DatabaseError("Failed to login");
        } finally {
            connection.release()
        }
    }
    InsertNewUser = async (data) => {
        const connection = await pool.getConnection(); // Get a connection from the pool
        try {
            const { username, password, email } = data;
            let retries = 5;
            let validKey;
    
            const [checkUserExisting] = await connection.query('SELECT username FROM user WHERE username = ?', [username]);
            const [checkEmailExisting] = await connection.query('SELECT email_address FROM user WHERE email_address = ?', [email]);
    
            if (checkUserExisting.length > 0) {
                throw new DatabaseError("This Username already exists in our system");
            }
    
            if (checkEmailExisting.length > 0) {
                throw new DatabaseError("This Email address already exists in our system");
            }
    
            // Implement Collision Protection
            while (retries > 0) {
                const generatedUserAddress = await EncryptionService.GenerateV4();
                const [verifyAddress] = await connection.query('SELECT user_address FROM user WHERE user_address = ?', [generatedUserAddress]);
                
                if (verifyAddress.length === 0) {
                    validKey = generatedUserAddress;
                    break;
                }
                
                retries -= 1;
                if (retries === 0) {
                    // if retrives is 0 threw the error
                    throw new DatabaseError("Unable to Create a unique user after multiple attempts");
                }
            }
           // const generatinSalt = await bcrypt.genSalt(10);
         //   const hashedPassword = await bcrypt.hash(password, 10); // Assuming bcrypt is used for hashing
    
            const SQL = {
                SQL_QUERY: 'INSERT INTO user (username, pwd, email_address, user_address, total_threads, total_posts, role, is_banned, is_suspended, susp_days, susp_Hours, total_messages_recived, current_messages, credits, reputation) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
                VALUES: [username, password, email, validKey, 0, 0, 'user', 0, 0, 0, 0, 0, 0, 0, 0]
            };
    
            const response = await connection.query(SQL.SQL_QUERY, SQL.VALUES);
            return response;
    
        } catch (err) {
            throw err;
        } finally {
            connection.release();
        }
    };
    
}

module.exports = new AuthRepository();