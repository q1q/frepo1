HOSTNMAME="somestring"
GITURL="https://github.com/q1q/repo3"
REPO=$(echo $GITURL | cut -d '/' -f 5)

Clone () {
	ssh -o StrictHostkeyChecking=no ${HOSTNAME}$i \
	"sudo apt-get update ; sudo apt-get -y install git ; git clone $GITURL" 
}

Runremote () () {
	ssh ${HOSTNAME}${i} "sh $REPO/$SCRIPT"
	
for ((i=$2;i!=($3+1);i++)) ; do
	$1
done