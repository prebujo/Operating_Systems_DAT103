#!/bin/bash

function push_space {
	for i in $(seq 0 $1)
	do
		echo -n " "
	done
}

for i in {0..255}
do
	echo -n -e "\r"
	push_space ${i}
	echo -e -n "\e[38;5;${i}m--==DAT103==--"
	sleep 0.1
done
