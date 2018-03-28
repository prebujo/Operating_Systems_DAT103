#!/bin/bash

read -p "Skriv en måned: " mnd

#mnd=$(tr "[:upper:]" "[:lower:]" <<< $mnd)

case $mnd in
	[df]*|ja*) echo "Det er vinter." ;;
	m*|ap*) echo "Det er vår." ;;
	ju*|au*) echo "Det er sommer." ;;
	[son]*) echo "Det er høst." ;;
	[A-ZÆØÅ]*) echo "Bruk små bokstaver." ;;
	*) echo "Bruk norske månedsnavn!" ;;
esac
