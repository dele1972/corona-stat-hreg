#!/usr/bin/python3

import os
from datetime import datetime
import cgitb

now = datetime.now()

cgitb.enable()

stringdate = now.strftime("%Y") + "-" + now.strftime("%m") + "-" + now.strftime("%d") + "T" + now.strftime("%H") + "-" + now.strftime("%M") + "-" + now.strftime("%S")
dirpath = os.getcwd()

with open(dirpath + "/write-output__" + stringdate + ".txt", "w") as text_file:
    print("hello", file=text_file)

print("Content-type: text/plain\r\n")
print(dirpath + "\r\n")
print(dirpath + "/write-output__" + stringdate + ".txt")
print("hj333")
