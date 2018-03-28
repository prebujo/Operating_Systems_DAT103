#!/bin/bash
for arg
do
	echo $arg
done

for arg in "$@"
do
	echo $arg
done
