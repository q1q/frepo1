HOST_FILE="output.txt"
SZ_HOST_FILE=$(wc -l $HOST_FILE | cut -b 1-2)

GITURL="https://github.com/q1q/frepo2"
REPO=$(echo $GITURL | cut -d '/' -f 5)
SCRIPT="minerd.sh"
KEY="/home/admin2/.ssh/amzk3.pem"
USER="ubuntu"

Clone () {
	ssh -o StrictHostKeyChecking=no -i $KEY $USER@$HOST_NM "echo REPO=$REPO >> .bashrc; sudo apt-get update ; sudo apt-get -y install git ; git clone $GITURL" 
}

Run () {
	ssh -i $KEY $USER@$HOST_NM "screen -dm sh $REPO/$SCRIPT $A $B $C"
}	


for ((i=$2;i!=($3+1);i++)) ; do
	HOST_NM=$(cat $HOST_FILE | head -$i | tail -1)
	echo $HOST_NM ;
	$1 
done




 
