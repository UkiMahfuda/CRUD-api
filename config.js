const mysql = require("mysql");

const db = mysql.createConnection({
  host: "sql6.freesqldatabase.com",
  port: 3306,
  user: "sql6700939",
  database: "sql6700939",
  password: "dfJ7LabJ9J",
});

module.exports = db;
