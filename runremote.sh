#!bin/bash

#this command will run any script from the respoitory. 
#parameters are start and stop values for ssh config names
 
HOSTNMAME="somestring"
SCRIPT="initscript.sh"
REPO="somestring"

#what I want to do is give the user options to pass parameters into the host-side script
#and if not to settle on default values - I think that is the most effective  

for ((i=$1;i!=($2+1);i++)) ; do
    ssh ${HOSTNAME}${i} "sh $REPO/$SCRIPT $A $B $C"
    done


