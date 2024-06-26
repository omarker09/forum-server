const pool = require("../configs/db")
const {DatabaseError, TransactionError} = require("../Utils/custom.error")
require("dotenv").config()

class CreditsRepository {
    TransferCredits = async (data) => {
        const connection = await pool.getConnection();
        try {
        await connection.beginTransaction();

        const sender_id = data.sender_id;
        const receiver_id = data.receiver_id;
        const message = data.message
        const amount = data.amount;

        // Checking address data type
        if (typeof sender_id == "number") {
            throw new TransactionError("Sender address not valid")
        }
        if (typeof receiver_id == "number") {
            throw new TransactionError("Receiver address not valid")
        }

        // Checking Address length
        if ((sender_id.split('')).length < 36 || sender_id.split('').length > 36) {
            throw new TransactionError("Sender address not valid")
        }
        if ((receiver_id.split('')).length < 36 || (receiver_id.split('')).length > 36) {
            throw new TransactionError("Receiver address not valid")
        }

        // Checking if sender address is the same
        if (sender_id === receiver_id) {
            throw new TransactionError("You cannot send credits to the same address")
        }

        // Verify user address exsisting
        const verifySender = await this.#VerifyUserAddress(sender_id);
        if (!verifySender) {
            throw new TransactionError(`Sender Address not exist`)
        }
        const verifyReceiver = await this.#VerifyUserAddress(receiver_id);
        if (!verifyReceiver) {
            throw new TransactionError(`Receiver Address not exist`)
        }
        
        // checking sender balance and Locking credits Column to prevent any race conditions 
        const [sender_rows] = await connection.query('SELECT credits FROM user WHERE user_address = ? FOR UPDATE', [sender_id])
        const senderCredits = sender_rows[0].credits;

        if (senderCredits < amount) {
            await this.#CreditsTransactionLog(data,'Failed','Insufficient funds',null);
            throw new TransactionError("Insufficient funds");
        }

        // Locking receiver credits Column
        await connection.query('SELECT credits FROM user WHERE user_address = ? FOR UPDATE', [receiver_id])

        const SENDER_SQL = {
            SQL_QUERY: 'update user set credits = credits - ? where user_address = ?',
            VALUE: [amount,sender_id]
        }
        const RECEIVER_SQL = {
            SQL_QUERY: 'update user set credits = credits + ? where user_address = ?',
            VALUE: [amount,receiver_id]
        }

        await connection.query(SENDER_SQL.SQL_QUERY,SENDER_SQL.VALUE)
        await connection.query(RECEIVER_SQL.SQL_QUERY,RECEIVER_SQL.VALUE)

        // Transaction Finsihed seccessfully
        await connection.commit();
        await this.#CreditsTransactionLog(data,'Completed',null,message || 'suck it');
        return { 
            response: 'Transaction completed successfully',
            sender: sender_id,
            receiver: receiver_id,
            message: message,
            amount: `${amount}`,
        };

        } catch (error) {
            // If anything wrong happend we rollback
            await connection.rollback();
        
            if (error instanceof TransactionError) {
                throw error; // Re-throw ValidationError to be handled in the service layer
            }

            await this.#CreditsTransactionLog(data,'Failed',error,'this is for you baby');
            throw new DatabaseError("Error while sending credits")
        } finally {
            // release the pool connection
            connection.release();
        }
    }
    VerifyBalance = async (data) => {
        const connection = await pool.getConnection();
        try {
            const sender_id = data.sender_id;
            const amount = parseInt(data.amount)
            const SQL = {
                SQL_QUERY: 'SELECT credits FROM user WHERE user_id = ?',
                VALUE: [sender_id]
            }
            const SelectCreditsBalance = await connection.query(SQL.SQL_QUERY,SQL.VALUE);
            const userCredits = parseInt(SelectCreditsBalance[0][0].credits)
            if (amount <= userCredits) {
                return true
            }
            return false
        } catch (err) {
            throw new DatabaseError(err)
        } finally {
            connection.release();
        }
    }
    #VerifyUserAddress = async (user_address) => {
        const connection = await pool.getConnection();
        try {
            const SQL = {
                SQL_QUERY: 'SELECT user_address FROM user WHERE user_address = ?',
                VALUE: [user_address]
            }

            const [response] = await pool.query(SQL.SQL_QUERY,SQL.VALUE)
            const responseLnegth = response.length
            if (responseLnegth < 1) {
                return false
            }

            return true
        } catch (err) {
            throw new DatabaseError(err)
        } finally {
            connection.release();
        }
    }
    #CreditsTransactionLog = async (data,transaction_status,failed_reason,transaction_message) => {
        const connection = await pool.getConnection();
        try {
            const {sender_id,receiver_id,amount} = data;

            const SQL_SENDER = {
                SQL_QUERY: 'SELECT username FROM user WHERE user_address = ?',
                VALUE: [sender_id]
            }
            const SQL_RECEIVER = {
                SQL_QUERY: 'SELECT username FROM user WHERE user_address = ?',
                VALUE: [receiver_id]
            }

            const [senderUsername] = await pool.query(SQL_SENDER.SQL_QUERY,SQL_SENDER.VALUE)
            const [receiverUsername] = await pool.query(SQL_RECEIVER.SQL_QUERY,SQL_RECEIVER.VALUE)

            if (senderUsername.length == 0 || receiverUsername.length == 0) {
                throw new DatabaseError("Username not found")
            }

            const resault = {
                nm1: senderUsername[0].username,
                nm2: receiverUsername[0].username
            }

            const SQL = {
                SQL_QUERY: 'INSERT INTO credits_transactions (sender_username,receiver_username,sender_user_address,receiver_user_address,amount,transaction_status,failed_reason,transaction_message) VALUES (?,?,?,?,?,?,?,?)',
                VALUE: [resault.nm1,resault.nm2,sender_id,receiver_id,amount,transaction_status,failed_reason,transaction_message]
            }
            const insertLog = await connection.query(SQL.SQL_QUERY,SQL.VALUE)

            return insertLog
        } catch (err) {
            throw err
        } finally {
            connection.release()
        }
    }
}

module.exports = new CreditsRepository()