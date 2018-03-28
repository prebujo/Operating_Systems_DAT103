#!/bin/bash

declare -i a=0
declare -i b=1

for((i=0; i<$1; i++)); do
        echo $a
        declare -i t=$a
        a=$b
        b+=$t
done

