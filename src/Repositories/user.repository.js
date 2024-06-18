const pool = require("../configs/db")
const {DatabaseError, ValidationError, AuthenticationError, NotFoundError} = require("../utils/custom.error")

class UserRepository {
    SelectUserByID = async (data) => {
        const connection = await pool.getConnection()
        try {
            console.log(data);
            const SQL = {
                SQL_QUERY: 'SELECT * FROM user WHERE user_id = ?',
                VALUE: [data.user_id]
            }
            const [response] = await connection.query(SQL.SQL_QUERY,SQL.VALUE);
            console.log(response[0]);
            return response[0]
        } catch (err) {
            throw new DatabaseError(err)
        } finally {
            connection.release();
        }
    }
}

module.exports = new UserRepository();