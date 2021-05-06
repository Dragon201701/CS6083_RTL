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
  // TODO: Register customer information in the database. 
    console.log('User register req: ', req.body)
    query = 'show tables'
    mysql_con.query(query, function (err, result) {
        if (err) throw err;
        console.log("User register sql result: " + result);
        res.send(result)
    });
})
app.get('/api/currentuser', (req, res) => {
  //TODO: return current customer inforamtion
    console.log('User login req: ', req.body)
    query = 'show tables'
    mysql_con.query(query, function (err, result) {
      if (err) throw err;
      console.log("User login sql result: " + result);
      res.send(result)
  });
})

app.post('/api/newbook/isbn', (req, res) => {
  console.log('New book isbn: ', req.body)
  isbn = 0;
  query = '';
  /*mysql_con.query(query, function (err, result){
    if (err) throw err;
      console.log("New book search isbn: " + result);
      res.send(result)
  })*/
  // TODO: If isbn exist, return the book information. If not, return an empty object.
  authors_ = []
  bnmae_ = ''
  topic_ = ''

  res.send({
    authors: authors_,
    bname: bname_,
    topic: topic_
  })
})
app.get('/', (req, res) => {
    res.send('Hello World!')
})
app.listen(port, () => {
  console.log(`Example app listening at http://localhost:${port}`)
})