HOSTA="idcf"
GITURL="https://github.com/q1q/repo3"
REPO=$(echo $GITURL | cut -d '/' -f 5)
SCRIPT="initscript.sh"

Clone () {
	ssh -o StrictHostkeyChecking=no ${HOSTA}$i \
	"sudo apt-get update ; sudo apt-get -y install git ; git clone $GITURL" 
}

Run () {
	ssh ${HOSTA}${i} "sh $REPO/$SCRIPT $A $B $C"
}	

Pull () {
	ssh ${HOSTA}${i} "cd $REPO ; git pull;" 
}
for ((i=$2;i!=($3+1);i++)) ; do
	$1
done