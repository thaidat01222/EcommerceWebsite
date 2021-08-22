const mysql = require('mysql2/promise');

const db = mysql.createPool({
    host: 'localhost',
    user: 'root',
    password: null,
    database: 'percy-book-store',
    connectionLimit: 100,
    waitForConnections: true
});
console.log('System: Connected to database');
global.db = db;
module.exports = db;