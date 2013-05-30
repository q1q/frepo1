#!/bin/bash
echo "start ="
read START
echo "stop="
read STOP

Transfer() {
	scp -o StrictHostkeyChecking=no s.sh rs$i:/root/
	ssh -o StrictHostkeyChecking=no rs$i "screen -d -m sh s.sh"
	}

Mine () {
	s=$[$i+24]
	ssh rs$i "screen -d -m ./gbt --url=us.litecoinpool.org:9332 --userpass=wetroof.$s:4444"
	}

Reboot () {
	ssh rs$i "reboot"
}



for ((i=$START;i!=($STOP+1);i++))
	do
	Mine
	done


