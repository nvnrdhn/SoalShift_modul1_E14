#!/bin/bash

n=1
for file in password/password*.txt
do
	count[n]=`cat $file`
	n=$((n + 1))
done
for ((i=1;i<=n;i++))
do
	if [ ! -f password/password$i.txt ]
	then
		pass=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12`
		for j in count
		do
			if [ "$pass" == "${count[j]}" ]
			then
				pass=`head /dev/urandom | tr -dc A-Za-z0-9 | head -c 12`
			break
			fi
		done
		echo $pass > password/password$i.txt
		break
	fi
done
