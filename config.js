const mysql = require("mysql");

const db = mysql.createConnection({
  host: "sql6.freesqldatabase.com",
  port: 3306,
  user: "sql6695747",
  password: "yNjlYn4LuA",
  database: "sql6695747",
});

module.exports = db;
