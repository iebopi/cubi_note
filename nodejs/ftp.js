var Client = require('ftp');
var fs = require('fs');
fs.readFile('input.txt', function (err, data) {
     if (err)    return console.log(err);
     console.info('async read:' + data.toString());
 })

// sync read
var data = fs.readFileSync('d:\\default1.mp4');
 
var c = new Client();
c.on('ready', function() {

  c.mkdir('newdir',true,function(err) {
    if (err) throw err;
  });

  c.cwd('newdir',function(err){
    if (err) throw err;
  });

  c.list('./',function(err,res){
    if (err) throw err;
  });

  c.system(function(err,res){
    if (err) throw err;
    console.info('OS:',res);
  });

  c.put(data, 'default1.mp4', function(err) {
    if (err) throw err;
    c.end();
  });
});

// connect to localhost:21 as anonymous 
var targetOptions = {

  host:'127.0.0.1',
  
  port:21,
  
  user:'iebopi',
  
  password:'123'
  
  }; 

c.connect(targetOptions);