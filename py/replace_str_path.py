#!/usr/bin/python
import os

for root, dirs, files in os.walk(os.getcwd()):
    for name in files:
        if name.endswith(".txt") or name.endswith(".sha1"):
			f1 = open(os.path.join(root, name), "r+")
			s = f1.read()
			f1.seek(0,0)
			f1.write(s.replace("m","n"))
            #os.remove(os.path.join(root, name))
            #print ("Delete File: " + os.path.join(root, name))
os.system("pause")

'''
pwd = os.getcwd()
list = os.listdir(pwd)
for file in list:
	if file.endswith(".txt"):
		print file
		f1 = open(file,"r+")
		s = f1.read()
		f1.seek(0,0)
		f1.write(s.replace("a","m"))
		f1.close()
os.system("pause")
'''