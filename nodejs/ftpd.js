const FtpSvr = require ( 'ftp-srv' );

const hostname = getIPAdress();
const port = 1111

const ftpServer = new FtpSvr ( 'ftp://' + hostname + ':' + port,
{ anonymous: true, greeting : [ "Hello", "World" ] } );

ftpServer.on ( 'login', ( data, resolve, reject ) =>
{
  resolve ( { root: 'D:/FTP' } );
  console.info ( 'login device-> ' + data.connection.ip );
});

ftpServer.on ( 'client-error', (connection, context, error) =>
{
  console.info ( 'client-error!' );
});

ftpServer.listen()
.then(() =>
{
  console.info ( `Server running at ftp://${hostname}:${port}/` );
});

function getIPAdress(){  
  var interfaces = require('os').networkInterfaces();  
  for(var devName in interfaces){  
        var iface = interfaces[devName];  
        for(var i=0;i<iface.length;i++){  
             var alias = iface[i];  
             if(alias.family === 'IPv4' && alias.address !== '127.0.0.1' && !alias.internal){  
                   return alias.address;  
             }  
        }  
  }  
}