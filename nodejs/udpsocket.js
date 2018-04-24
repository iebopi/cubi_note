/*============= usage:
var UdpSocket = require('./udpsocket');
udpsocket = new UdpSocket;
udpsocket.send();
===================*/

/*server*/
const dgram = require('dgram'); 
const server = dgram.createSocket('udp4'); //创建udp服务器
const multicastAddr = '239.0.0.1';

//以下server.on 都是在监听不同信号
server.on('close',()=>{ // ()=> 是 ES6的箭头函数，写成 function()也是可以的
    console.info('socket已关闭');
});

server.on('error',(err)=>{
    console.info(err);
});

server.on('listening',()=>{
    console.info('socket正在监听中...');
    server.addMembership(multicastAddr); //加入组播组
    server.setMulticastTTL(128);

});

server.on('message',(msg,rinfo)=>{
    console.info(`receive message from ${rinfo.address}:${rinfo.port}`);
});

function sendMsg(){
    let ver_msg = 0x01;
    let type_msg = 0x10;
    let os = require("os");
    let networkInterfaces = os.networkInterfaces();
    let ip_addr = networkInterfaces['本地连接'][1].address;
    //let ip_addr = '192.168.203.35';
    let len_msg = ip_addr.length + 4;
    let type_para = 0x01;
    let len_para = ip_addr.length;
    let message = Buffer.from([ver_msg, type_msg, 0x00, len_msg, 0x00, type_para, 0x00, len_para]) + ip_addr;
    this.send = function(){
        server.send(message,0,message.length,9000,multicastAddr);
        console.info('msg has sended.');
    }
    //通过server.send发送组播
    //参数分别是，数据（buffer或者string），偏移量（即开始发送的位子），数据长度，接收的端口，组播组

    //循环发送
    /*setInterval(()=>{
        this.send();
        console.log("send message");
    },1500);*/
}

server.bind(9000); //绑定端口，不绑定的话也可以send数据但是无法接受


module.exports = sendMsg;  