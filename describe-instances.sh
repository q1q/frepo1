#!/bin/bash 

if [ $1 ] ; then
	EC2_URL=$1
fi

echo "output-file-name" ; read OFN

ec2-describe-instances | grep INSTANCE | cut -f4 > $OFN
