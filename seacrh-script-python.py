import re
import os
from glob import glob
from subprocess import Popen, PIPE
import sys
from time import sleep
import subprocess

#print ("This script created by Ravi Bhargava®")
print ("\033[1;33;40m--NICE Engage VOIP CALL Flow= CTI-->ConnectionManager-->Driver-->CallServer-->RCM-->IPCapture---\033[0m")
print("\n")
print ("\033[1;35;40mPlease select below option:-")



print("\033[1;32;40m1. Search all logs by interaction ID:")
print("2. Search all logs by Call direction(Inbound,Internal,Outbound)")
print("3. Search all logs by Hold State ")
print("4. Search all logs by Extension ID ")
print("5. Search all logs by Mobile No. ")

Choice = int(input("Enter Choice: "))

try:
    if (Choice == 1):
        in1=int(input("ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:"))
  #ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:6728267615138022822
        in2=str(input("ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL):"))
#ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL):INCOMMING
      
        while not re.match('^(INCOMMING|OUTGOING|INTERNAL)$',in2):
                print ("\033[2;31;40mError! Make sure you only use 'INCOMMING','OUTGOING','INTERNAL' as input")
                break
        else:
                p1 = Popen(["zgrep",'--color=always',"%s"%in1] + glob(os.path.expanduser('*.log*')),stdout=PIPE)
                p2 = Popen(["grep",'--color=always', "%s"%in2], stdin=p1.stdout)
                p1.stdout.close()
                p2.wait()
                p1.wait()
                p1.returncode
                if p2.returncode ==1:
                    print("\033[2;31;40mNo log results for this search")
    elif (Choice == 2):
        in3=int(input("ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:"))
  #ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:6728267615138022822
        in4=str(input("ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL):"))
#ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL):INCOMMING
        while not re.match('^(INCOMMING|OUTGOING|INTERNAL)$',in4):
                print ("\033[2;31;40mError! Make sure you only use 'INCOMMING','OUTGOING','INTERNAL' as input")
                break
        else:
                p3 = Popen(["zgrep",'--color=always',"%s"%in3] + glob(os.path.expanduser('*.log*')),stdout=PIPE)
                p4 = Popen(["grep",'--color=always', "%s"%in4], stdin=p3.stdout)
                p3.stdout.close()
                p4.wait()
                p3.wait()
                p3.returncode
                if p4.returncode ==1:
                    print("\033[2;31;40mNo log results for this search")
    elif (Choice == 3):
            in5=int(input("ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:"))
  #ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:6728267615138022822
            p5 = Popen(["zgrep",'--color=always',"%s"%in5] + glob(os.path.expanduser('*.log*')),stdout=PIPE)
            p6 = Popen(["grep",'--color=always', "HeldState"], stdin=p5.stdout)
            p5.stdout.close()
            p6.wait()
            p5.wait()
            p5.returncode
            if p6.returncode ==1:
                print("\033[2;31;40mNo log results for this search")
    elif (Choice == 4):
        in7=int(input("ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:"))
  #ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK:6728267615138022822
        p7 = Popen(["zgrep",'--color=always',"%s"%in7] + glob(os.path.expanduser('*.log*')),stdout=PIPE)
        p8 = Popen(["grep",'--color=always', ""], stdin=p7.stdout)
        p7.stdout.close()
        p8.wait()
        p7.wait()
        p7.returncode
        if p8.returncode ==1:
            print("\033[2;31;40mNo log results for this search")
    elif (Choice == 5):
        in9=int(input("ENTER THE PHONE NO. WHICH YOU NEED TO CHECK: "))
    #Sample phone number 0199323979
        in10=str(input("ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL):"))
#ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL):INCOMMING
        while not re.match('^(INCOMMING|OUTGOING|INTERNAL)$',in10):
                print ("\033[2;31;40mError! Make sure you only use 'INCOMMING','OUTGOING','INTERNAL' as input")
                break
        else:
                p9 = Popen(["zgrep",'--color=always',"%s"%in9] + glob(os.path.expanduser('*.log*')),stdout=subprocess.PIPE)
                p10 = Popen(["grep",'--color=always',"%s"%in10], stdin=p9.stdout)
                p9.stdout.close()
                p10.wait()
                p9.wait()
                p9.returncode
                if p10.returncode ==1:
                    print("\033[2;31;40mNo log results for this search")
            
#value_error():
except ValueError:
    print("\033[2;31;40mPlease enter id as a integer\033[0m")
    
