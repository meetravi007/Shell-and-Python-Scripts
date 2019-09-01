#!/bin/sh
inversvid="\0033[7m"
resetvid="\0033[0m"
redback="\0033[1;37;41m"
greenback="\0033[1;37;42m"
blueback="\0033[1;37;44m"
# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

echo  "$BGreen --This script created by Ravi Bhargava® $resetvid--- $resetvid"
echo "$blueback--NICE VOIP CALL Flow --ConnectionManager--Driver--CallServer--RCM--IPCapture---$resetvid"
echo "Please select below option"
echo "1. Search all logs by $BRed interaction ID: $resetvid"
echo "2. Search all logs by $BRed Call direction(Incoming,Internal,Outgoing)$resetvid"
echo "3. Search all logs by $BRed Hold State $resetvid"
echo "4. Search all logs by $BRed Extension ID $resetvid"
echo "5. Search all logs by $BRed Mobile No. $resetvid "
echo ""
read -p "Enter Choice:" choice
if [ "$choice" = "1" ] ; then 
	echo ""
while read -p "ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK: " IID
do 	read -p "ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL): " dc
	echo ""
	zgrep --color=always $IID *.log.* | grep --color=always $dc ; break;
done

else
if [ "$choice" = "2" ] ; then
	echo ""
while read -p "ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK: " IID
do 	read -p "ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL): " dc
	echo ""
	zgrep --color=always $IID *.log.* | grep --color=always $dc ; break;
done
else

if [ "$choice" = "3" ] ; then 
	echo ""
read -p "ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK: " IID
	echo ""
	zgrep --color=always $IID *.log.* | grep --color=always "HeldState"

else	
if [ "$choice" = "4" ]; then
echo ""
while read -p "ENTER THE INTERACTION ID WHICH YOU NEED TO CHECK: " IID
do 	read -p "ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL): " dc
	echo ""
	zgrep --color=always $IID *.log.* | grep --color=always $dc ; break;
done
else
if [ "$choice" = "5" ]; then
echo ""
read -p "ENTER THE PHONE NO. WHICH YOU NEED TO CHECK: " PNO
#do 	read -p "ENTER THE DIRECTION OF THE CALL (INCOMMING,OUTGOING,INTERNAL): " dc
	echo ""
	zgrep --color=always $PNO Driver*.log.* | grep --color=always "INCOMMING" ; break;

fi
fi
fi
fi
fi