schtasks /create /tn "开机打开网页" /sc onstart /tr "C:\Users\Z\Desktop\test.cmd"

schtasks  /create /tn "定时打开" /sc once /st 15:08:00 /tr "C:\Users\Z\Desktop\test.cmd"