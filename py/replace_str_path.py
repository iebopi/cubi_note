#!/usr/bin/python
import os
import sys

str_ends = sys.argv[1]
str_from = sys.argv[2]
str_to = sys.argv[3]

for root, dirs, files in os.walk(os.getcwd()):
    for name in files:
        if name.endswith(str_ends):
			filename = os.path.join(root, name)
			f1 = open(filename, "r+")
			s = f1.read()
			f1.close()
			f1 = open(filename, "w")
			f1.write(s.replace(str_from,str_to))
			f1.close()
os.system("pause")

'''
pwd = os.getcwd()
list = os.listdir(pwd)
for file in list:
	if file.endswith(str_ends):
		print file
		f1 = open(file,"r+")
		s = f1.read()
		f1.open(file,"w")
		f1.seek(0,0)
		f1.write(s.replace(str_from,str_to))
		f1.close()
os.system("pause")
'''