const pool = require("../configs/db")
const {DatabaseError, ValidationError, AuthenticationError, NotFoundError} = require("../utils/custom.error")

class ThreadRepository {
    InsertNewThread = async (data) => {
        const connection = await pool.getConnection();
        console.log(data);
        try {

            const SQL = {
                SQL_QUERY: 'INSERT INTO thread (user_id,thread_status,thread_content,thread_title,column_name,categorie,posts_count) VALUES (?,?,?,?,?,?,?)',
                VALUE: [data.user_id, 'Completed', data.thread_content,data.thread_title, "test", "test", 1]
            }
            const insert = await pool.query(SQL.SQL_QUERY, SQL.VALUE);
            console.log(insert);
            return insert
        } catch (err) {
            throw new DatabaseError(err)
        } finally {
            connection.release();
        }
    }
}

module.exports = new ThreadRepository();