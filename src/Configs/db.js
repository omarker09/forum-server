const mysql = require('mysql2/promise');
require('dotenv').config();

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port: process.env.DB_PORT,
  waitForConnections: false,
  connectionLimit: 0,
  queueLimit: 0,
});

async function executeConnection() {
  try {
    // Get a connection from the pool
    const connection = await pool.getConnection();
    console.log('Database connection successful');
  } catch (err) {
    console.error('Error connecting to the database: ', err);
  }
}

// start the connection when the server starts [Only if you want it always running]
// executeConnection();


module.exports = pool;
