#!/bin/bash

cut -f 1 -d ":" /etc/passwd

echo $(cut -f 1 -d ":" /etc/passwd | grep -c "")
