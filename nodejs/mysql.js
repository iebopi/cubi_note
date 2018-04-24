/*================= usage:
var Sql = require('./mysql');
sql= new Sql;
sql.count(function(results){console.info('count is',results[0]['count(*)']);});
sql.inquireLimit([1,3], function(results){console.info('callback test is:',results[0].Image_name);});
sql.insert([null,'test_name',null,null,null,null,null,null,null,null,null,null],function(){console.info('insert done!');});
sql.update([null,'test_name000',null,null,null,null,null,null,null,null,null,null,11],function(){console.info('update done!');});
sql.delete(10,function(){console.info('delete done!');});
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
      connection.query('SELECT 1 + 1 AS solution', function (error, results, fields) {
        if (error) throw error;
        console.info('The solution is: ', results[0].solution);
        callback(results);
      });
    }


    this.inquireLimit = function(inquireParams,callback) {
      connection.query('SELECT * from speaker_info limit ?,?', inquireParams, function (error, results, fields) {
        if (error) throw error;
        console.info('The inquire name is: ', results[1].Image_name);
        callback(results);
      });
    }

    this.insert = function(insertParams,callback) {
      let  insertSql = 'INSERT INTO speaker_info(Bg,Image_name,Bg_color,T_text_row1,\
                      T_text_row2,T_size,T_color,T_font,T_time,Image_num,Image_name_array,\
                      Image_time) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)';
      connection.query(insertSql, insertParams, function (error, results, fields) {
        if (error) throw error;
        callback(results);
      });
    }

    this.update = function(updateParams,callback) {
      let  updateSql = 'UPDATE speaker_info SET Bg = ?,Image_name = ?,Bg_color = ?,\
                        T_text_row1 = ?, T_text_row2 = ?, T_size = ?, T_color = ?,\
                        T_font = ?, T_time = ?, Image_num = ?, Image_name_array = ?,\
                        Image_time = ? WHERE Id = ?';
      connection.query(updateSql, updateParams, function (error, results, fields) {
        if (error) throw error;
        callback(results);
      });
    }

    this.delete = function(deleteParams,callback) {
      let  deleteSql = 'DELETE FROM speaker_info where id = ?';
      connection.query(deleteSql, deleteParams, function (error, results, fields) {
        if (error) throw error;
        callback(results);
      });
    }

    this.count = function(callback) {
      let  countSql = 'SELECT count(*) FROM speaker_info';
      connection.query(countSql, function (error, results, fields) {
        if (error) throw error;
        callback(results);
      });
    }

 }

 module.exports = sql;