/*============= usage:
var Sql = require('./mysql2');
sql= new Sql;
sql.insert([null,'test_name',null,null,null,null,null,null,null,null,null,null]).then(function(results){
  console.info('insert done!');
});
sql.count().then(function(results){
  console.info('count is',results[0]['count(*)']);
});
===================*/

var mysql      = require('mysql');
var connection = mysql.createConnection({
  host     : 'localhost',
  user     : 'root',
  password : '123',
  database : 'sps'
});
 
connection.connect();
function sql() { 
    this.test = function(callback) {
      return new Promise((resolve,reject) => {
        connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
          if (error) throw error;
          console.info('The solution is: ', results[0].solution);
          resolve(results);
        });
      });
    }


    this.inquireLimit = function(inquireParams,callback) {
      return new Promise((resolve,reject) => {
        connection.query('SELECT * from speaker_info limit ?,?', inquireParams, function (error, results, fields) {
          if (error) throw error;
          console.info('The inquire name is: ', results[1].Image_name);
          resolve(results);
        });
      });
    }

    this.insert = function(insertParams,callback) {
      return new Promise((resolve,reject) => {
        let  insertSql = 'INSERT INTO speaker_info(Bg,Image_name,Bg_color,T_text_row1,\
                      T_text_row2,T_size,T_color,T_font,T_time,Image_num,Image_name_array,\
                      Image_time) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)';
        connection.query(insertSql, insertParams, function (error, results, fields) {
          if (error) throw error;
          resolve(results);
        });
      });
    }

    this.update = function(updateParams) {
      return new Promise((resolve,reject) => {
        let  updateSql = 'UPDATE speaker_info SET Bg = ?,Image_name = ?,Bg_color = ?,\
                        T_text_row1 = ?, T_text_row2 = ?, T_size = ?, T_color = ?,\
                        T_font = ?, T_time = ?, Image_num = ?, Image_name_array = ?,\
                        Image_time = ? WHERE Id = ?';
        connection.query(updateSql, updateParams, function (error, results, fields) {
          if (error) throw error;
          resolve(results);
        });
      });
    }

    this.delete = function(deleteParams) {
      return new Promise((resolve,reject) => {
          let  deleteSql = 'DELETE FROM speaker_info where id = ?';
          connection.query(deleteSql, deleteParams, function (error, results, fields) {
            if (error) throw error;
            resolve(results);
          });
      });
    }

    this.count = function() {
      return new Promise((resolve,reject) => {
        let  countSql = 'SELECT count(*) FROM speaker_info';
        connection.query(countSql, function (error, results, fields) {
          if (error) throw error;
          resolve(results);
        });
    });
    }

 }

 module.exports = sql;