#!/bin/bash
echo "Hei dere."
declare -i tall
read -p "Gi et tall: " tall
echo "Tallet er: $tall"
[ $# -eq 0 ] && set -- *
echo "Antall argumenter er $#."
echo "Første argument er: $1."
[ $# -gt 1 ] && echo "Andre argument er: $2."
echo "Alle argumenter er: $@."
