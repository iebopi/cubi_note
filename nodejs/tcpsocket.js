/*============= usage:
var TcpSocket = require('./tcpsocket');
var rev_para = {'ipAddr':'','deviceType':''};
var para_textscreen = {'bgColor':'0xffffff','bgImageName':'bg.jpg','bgIsColor':'0','textRow1':'张3','textRow2':'张5','fontColor':'0x7fff00','fontType':'simli','fontSize':'400','textIntervalTime':'4'};
var para_logoscreen = {'imageNum':'2','imageArray':'bg1.jpg,bg3.jpg','imgIntervalTime':'4'};
var send_para = Object.assign(para_textscreen,para_logoscreen);
tcpsocket = new TcpSocket(rev_para, //客户端反馈参数
  function(textscreenIsLive,logoscreenIsLive) {
    console.info('callback textscreenIsLive:',textscreenIsLive);
    console.info('callback logoscreenIsLive:',logoscreenIsLive);
  }, // 心跳回调
  function() {
    console.info('tcp socket received data,device type is:',rev_para.deviceType);
  } // 组播反馈回调
);
tcpsocket.send_text_info(send_para); // 服务器推送信息
tcpsocket.send_logo_info(send_para);
===================*/

var rev_para = {'ipAddr':'','deviceIdentfy':'','clientIsLive':''};
var send_para = {'':'','':''};
function tcp_send_msg(callbackHeatbeat,callbackClientRequest) {
    var net = require('net');

    var PORT = 8887;
    var socket_logoscreen,socket_textscreen;

    // 心跳检测
    var textscreenHeatbeartTime,logoscreenHeartbeatTime;
    var textscreenIsLive = false;
    var logoscreenIsLive = false;
    var sock_interval = setInterval(function() {
        if( (textscreenHeatbeartTime != undefined) && (new Date().getTime() - textscreenHeatbeartTime > 2000)) {
            console.info('network interrupted! now:',new Date().getTime());
            console.info('network interrupted! last heatbeat:',textscreenHeatbeartTime);
            textscreenIsLive = false;
            socket_textscreen.end();
            //clearInterval(sock_interval);
            callbackHeatbeat(textscreenIsLive,logoscreenIsLive);
        }
        if( (logoscreenHeartbeatTime != undefined) && (new Date().getTime() - logoscreenHeartbeatTime > 2000)) {
            console.info('network interrupted! now:',new Date().getTime());
            console.info('network interrupted! last heatbeat:',logoscreenHeartbeatTime);
            logoscreenIsLive = false;
            socket_logoscreen.end();
            //clearInterval(sock_interval);
            callbackHeatbeat(textscreenIsLive,logoscreenIsLive);
        }

    }, 1000);

    // 创建一个TCP服务器实例，调用listen函数开始监听指定端口
    // 传入net.createServer()的回调函数将作为”connection“事件的处理函数
    // 在每一个“connection”事件中，该回调函数接收到的socket对象是唯一的
    
    var tcpserver = net.createServer(function(sock) {

        // 我们获得一个连接 - 该连接自动关联一个socket对象
        console.info('CONNECTED: ' +
            sock.remoteAddress + ':' + sock.remotePort);


        let ver_msg,len_msg,type_msg;
        let len_para,type_para,val_para;
        let cnt_para;
        let array_para = []; 

        // 为这个socket实例添加一个"data"事件处理函数
        sock.on('data', function(data) {
            // parse socket data
            //console.info('client say:'+ data);
            heatbeatTime = new Date().getTime();
            len_msg = (data[2] << 8) + data[3];
            ver_msg = data[0];
            type_msg = data[1];
            let msg_str = '' + data;
            if(msg_str == 'hello') {
                console.info('recieved hello!');
                //sock.write('ok\r\n');
                //socket_textscreen = sock;
                return;
            }
            if(0x01 !== ver_msg)
                return;
            data = data.slice(4, 4 + len_msg);
            while(data.length > 4) {
                type_para = (data[0] << 8) + data[1];
                len_para = (data[2] << 8) + data[3];
                val_para = data.slice(4, 4 + len_para);
                array_para.push({type_para, val_para});
                data = data.slice(4 + len_para, data.length);
            }
            cnt_para = array_para.length;
            //console.info('len of array_para is',cnt_para);

            // parse msg
            if((0x01 == ver_msg) & (0x11 ==type_msg)) {//组播反馈消息
                console.info('version is',ver_msg);
                for(i=0; i<cnt_para; i++) {
                    switch(array_para[i].type_para) {
                        case 0x0001:
                            let ipAddr = '' + array_para[i].val_para;
                            rev_para.ipAddr = ipAddr;
                            break;
                        case 0x0002:
                            let deviceType = array_para[i].val_para;
                            rev_para.deviceType = '' + array_para[i].val_para;
                            break;
                    }
                }
            }
            else if((0x01 == ver_msg) & (0x12 ==type_msg)) {
                console.info('heartbeat msg.');
            }

            switch( rev_para.deviceType) {
                case 'textscreen':
                    socket_textscreen = sock;
                    textscreenHeatbeartTime = new Date().getTime();
                    console.info('heatbeat recv time:',textscreenHeatbeartTime);
                    textscreenIsLive = true;
                    console.info('textscreen heartbeat');
                    break;
                case 'logoscreen':
                    socket_logoscreen = sock;
                    logoscreenHeartbeatTime = new Date().getTime();
                    console.info('heatbeat recv time:',logoscreenHeartbeatTime);
                    logoscreenIsLive = true;
                    console.info('logoscreen heartbeat');
                    break;
                default:
                    socket_textscreen = sock;
                    console.info('uknown device heartbeat');
                    sock.end();
                    break;
            }
            console.info('DATA ' + sock.remoteAddress + ': ' + data);
            // 回发该数据，客户端将收到来自服务端的数据
            //sock.write('You said "' + data + '"');
            callbackHeatbeat(textscreenIsLive,logoscreenIsLive); // 客户端心跳状态 callback
            callbackClientRequest(); // 客户端TCP连接 callback
        });

        // 为这个socket实例添加一个"close"事件处理函数
        sock.on('close', function(data) {
            sock = null;
            console.info('CLOSED: ' +
                sock.remoteAddress + ' ' + sock.remotePort);
        });

    }).listen(PORT);

    console.info('Server listening on port' + ':'+ PORT);


    this.send_text_info = function(send_para) {
        //socket.write('===== tcp server send msg:'+ send_para.name + '\r\n');
        console.info('===== tcp server send msg:',send_para.name);
        let ver_msg = 0x01;
        let type_msg = 0x13;

        let name,ipAddr,len_msg,type_para,len_para,buf_para;
        let header_msg
        let content_msg = Buffer.from('');
        len_msg = 0;
        for(var val in send_para) {
            console.info(send_para[val]);
            switch(val) {
                case 'bgIsColor':
                    buf_para = Buffer.from([+send_para.bgIsColor]);
                    type_para = 0x0001;
                    break;
                case 'bgImageName':
                    buf_para = Buffer.from(send_para.bgImageName);
                    type_para = 0x0002;
                    break;
                case 'bgColor':
                    let bgColor = +send_para.bgColor; 
                    buf_para = Buffer.from([bgColor/256/256, bgColor/256, bgColor]);
                    type_para = 0x0003;
                    break;
                case 'textRow1':
                    buf_para = Buffer.from(send_para.textRow1);
                    type_para = 0x0004;
                    break;
                case 'textRow2':
                    buf_para = Buffer.from(send_para.textRow2);
                    type_para = 0x0005;
                    break;
                case 'fontSize':
                    let fontSize = send_para.fontSize;
                    buf_para = Buffer.from([fontSize/256, fontSize]);
                    type_para = 0x0006;
                    break;
                case 'fontColor':
                    let fontColor = +send_para.fontColor;
                    buf_para = Buffer.from([fontColor/256/256, fontColor/256, fontColor]);
                    type_para = 0x0007;
                    break;
                case 'fontType':
                    buf_para = Buffer.from(send_para.fontType);
                    type_para = 0x0008;
                    break;
                case 'textIntervalTime':
                    let textIntervalTime = +send_para.textIntervalTime;
                    buf_para = Buffer.from([textIntervalTime/256,textIntervalTime]);
                    type_para = 0x0009;
                    break;
                default:
                    continue;
            }
            len_para = buf_para.length;
            len_msg += len_para + 4;
            let header_para = Buffer.from([type_para>>8,type_para,len_para>>8,len_para]);
            content_msg = bufcopy(header_para,content_msg);
            content_msg = bufcopy(buf_para,content_msg);
        }

        header_msg = Buffer.from([ver_msg, type_msg, (len_msg>>8), len_msg]);
        let message = bufcopy(content_msg,header_msg);
        if(socket_textscreen != undefined) {
            socket_textscreen.write(message);
        }
    }


    this.send_logo_info = function(send_para) {
        console.info('===== tcp server send msg:',send_para.name);
        let ver_msg = 0x01;
        let type_msg = 0x14;
    
        let len_msg,type_para,len_para,buf_para;
        let header_msg
        let content_msg = Buffer.from('');
        len_msg = 0;
        for(var val in send_para) {
            console.info(send_para[val]);
            switch(val) {
                case 'imageNum':
                    buf_para = Buffer.from([send_para.imageNum/256,send_para.imageNum]);
                    type_para = 0x0001;
                    break;
                case 'imageArray':
                    buf_para = Buffer.from(send_para.imageArray);
                    type_para = 0x0002;
                    break;
                case 'imgIntervalTime':
                    let imgIntervalTime = +send_para.imgIntervalTime;
                    buf_para = Buffer.from([imgIntervalTime/256,imgIntervalTime]);
                    type_para = 0x0003;
                    break;
                default:
                    continue;
            }
            len_para = buf_para.length;
            len_msg += len_para + 4;
            let header_para = Buffer.from([type_para>>8,type_para,len_para>>8,len_para]);
            content_msg = bufcopy(header_para,content_msg);
            content_msg = bufcopy(buf_para,content_msg);
        }
    
        header_msg = Buffer.from([ver_msg, type_msg, (len_msg>>8), len_msg]);
        let message = bufcopy(content_msg,header_msg);
        if(socket_logoscreen != undefined) {
            socket_logoscreen.write(message);
        }
    }
}



var bufcopy = function(src,dest) {
    let result = new Buffer(dest.length + src.length);
    dest.copy(result,0,0,dest.length);
    src.copy(result,dest.length,0,src.length);
    return result;
}

module.exports = tcp_send_msg;
