#!/bin/bash

read -p "Skriv en måned: " mnd

mnd=$(tr "[:upper:]" "[:lower:]" <<< $mnd)

case $mnd in
	desember|januar|februar)
		echo "Det er vinter."
		;;
	mars|april|mai)
		echo "Det er vår."
		;;
	juni|juli|august)
		echo "Det er sommer."
		;;
	september|oktober|november)
		echo "Det er høst."
		;;
	*)
		echo "Bruk norske månedsnavn!"
		;;
esac
