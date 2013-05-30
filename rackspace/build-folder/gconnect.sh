#!/bin/bash
echo "up ="
read UP
echo "low="
read LOW

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

for ((i=$LOW;i<$UP;i++))
	do
	Mine
	done


