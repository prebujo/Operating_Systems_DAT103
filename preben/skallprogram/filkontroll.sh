#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Bruk: filkontroll.sh <intervall> <filnavn>"
  exit 1
fi


inter=$1
fil=$2

declare creation
declare startstatus

if [ -e fil ]; then
  creation = `stat -c %Y fil`
  startstatus=true
else
  startstatus=false
fi

#loop for å se etter endringer i fil
while [ true ]; do
  sleep $inter
  #lager og setter en variabel ny status
  declare nystatus
  if [ -e $fil ]; then
    nystatus=true
  else
    nystatus=false
  fi
  #sjekker om status er endret og printer da enten slettet eller opprettet og avslutter loop
  if [ $nystatus != $startstatus ]; then
    if [ $nystatus == true ]; then
      echo "Filen $fil ble opprettet"
    else
      echo "Filen $fil ble slettet"
    exit 0
  fi

  #sjekker om filen er endret siden start
  change = `stat -c %Y fil`
  if [ $change != $creation ]; then
    echo "Filen $fil ble endret"
    exit 0
  fi

done

