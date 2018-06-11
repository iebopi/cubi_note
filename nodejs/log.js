var log = require('electron-log');
var fs = require('fs');
var os=require('os');
 
log.transports.file.level = 'info';
log.transports.file.format = '{y}-{m}-{d} {h}:{i}:{s}:{ms} {text}';
log.transports.file.maxSize = 5 * 1024 * 1024;
log.transports.file.file = __dirname + '/log.txt';
log.transports.file.streamConfig = { flags: 'w' };
log.transports.file.stream = fs.createWriteStream('log.txt',{'flags':'a'});

log.log('---------------------------');
log.log('');
log.log('DMS Starting...');

log.log(os.hostname() + ' ' + os.release() + ' ' + os.arch());
log.log('Free Memory:' + (os.freemem()/1024/1024).toFixed(0) + 'MB');