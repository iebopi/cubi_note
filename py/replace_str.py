#!/usr/bin/python
import os
import sys

filename = sys.argv[1]
str_from = sys.argv[2]
str_to = sys.argv[3]

f1 = open(filename,"r+")
s = f1.read()
f1.close()
f1 = open(filename,"w")
#f1.seek(0,0)
f1.write(s.replace(str_from, str_to))
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
	f2.write(line.replace(str_from,str_to))
	if len(li)>0:
		count=count+len(li)  

f1.close()
f2.close() 
'''