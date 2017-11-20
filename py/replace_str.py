#!/usr/bin/python
import os

f1 = open("file1.txt","r+")
s = f1.read()
f1.seek(0,0)
f1.write(s.replace("aa","good"))
f1.close()
os.system("pause")


# another method
'''
import re  

f1 = open("file1.txt","r")
f2 = open("file2.txt","w")

count=0;  
for line in f1.readlines():  
	li=re.findall("bb",line)
	f2.write(line.replace("aa","good"))
	if len(li)>0:
		count=count+len(li)  

f1.close()
f2.close() 
'''