var mysql = require('mysql2');

var mysql_con = mysql.createConnection({
    host: "localhost",
    user: "cs6083_general",
    password: "666666",
    database: 'cs6083_project_test'
  });

export default mysql_con;