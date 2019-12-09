import serial
import csv
import sys
import time
dev_name = sys.argv[1] # "COM4"
radix_g_array = int(sys.argv[2],10) # 10
sleep_time = int(sys.argv[3],10) # 50
reverse = int(sys.argv[4],10)

csvFile1 = open('th_zb.csv','r')
reader1 = csv.reader(csvFile1)
data1 = []
for item in reader1:
	data1.append(item)
csvFile1.close()

csvFile2 = open('my_zb.csv','r')
reader2 = csv.reader(csvFile2)
data2 = []
for item in reader2:
	data2.append(item)
csvFile2.close()

csvFile3 = open('g_array.csv','r')
reader3 = csv.reader(csvFile3)
data3 = []
for item in reader3:
	data3.append(item)
csvFile3.close()

def recv(serial):
    while True:
        data = serial.readline()
        if data == b'':
            continue
        else:
            break
        time.sleep(0.02)
    return data

try:
  portx = dev_name
  bps=115200
  timex=5 # wait. None,0, n seconds
  ser=serial.Serial(portx,bps,timeout=timex)
  result=ser.write('t'.encode())
  print("tx begin bytes:",result)
  radix = 16
  while True:
    data_recv =recv(ser)
    print(data_recv)
    if data_recv.decode() == 'th_zb' + '\r\n' :
       line_count_max = 2
       data = data1
    elif data_recv.decode() == 'my_zb' + '\r\n' :
        line_count_max = 2
        data = data2
    elif data_recv.decode() == 'g_array' + '\r\n' :
        line_count_max = 512
        data = data3
        radix = radix_g_array #10
    else :
        break
    time.sleep(0.1)
    count = 0
    burst_count = 0
    line_count = 0
    while(line_count < line_count_max):
        while(burst_count < 8):
            while (count < 80):
                index = line_count*640 + burst_count*80 + count
                if (data_recv.decode() == 'g_array' + '\r\n') & (reverse != 0) :
                    index = 640*512 - 1 - (line_count*640 + burst_count*80 + count)
                if index < len(data):
                        d=int(data[index][0],radix)
                else:
                    d=0
                tmp = [(d>>0)&0xff, (d>>8)&0xff, (d>>16)&0xff, (d>>24)&0xff]
                result=ser.write(tmp)
#                print("tx 4 bytes:",d,"count=",count)
                count = count + 1
            tmp = [0xdd,0xcc,0xbb,0xaa]
            result=ser.write(tmp)
            print("burst end, burst_count:",burst_count,"line_count:",line_count)
            count = 0
            burst_count = burst_count + 1
            data_recv =recv(ser)
            time.sleep(sleep_time*0.001)#time.sleep(0.05)
            if data_recv.decode() == 'continue.' + '\r\n' :
                continue
        burst_count = 0
        line_count = line_count + 1
        print("line end, line_count:",line_count)
    print("tx end")
  ser.close()

except Exception as e:
    print("---Exception---：",e)