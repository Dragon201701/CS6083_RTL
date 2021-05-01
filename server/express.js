const express = require('express')
const cors = require('cors')
const app = express()
const port = 3000
var mysql = require('mysql');

var mysql_con = mysql.createConnection({
    host: "localhost",
    user: "cs6083_general",
    password: "666666",
    database: 'cs6083_project_test'
});

app.use(cors())


app.post('/api/register', (req, res) => {
    console.log('User register req: ', req.body)
    mysql_con.connect((err) => {
        if (err) throw err;
        console.log("User register connected.");
        mysql_con.query('show tables', function (err, result) {
            if (err) throw err;
            console.log("Result: " + result);
            res.send(result)
            mysql_con.end()
        });
    })
    /*mysql_con.end((err) => {
        // The connection is terminated gracefully
        // Ensures all remaining queries are executed
        // Then sends a quit packet to the MySQL server.
    });*/
    
})
app.get('/', (req, res) => {
    res.send('Hello World!')
  })
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})