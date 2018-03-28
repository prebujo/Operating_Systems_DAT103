#!/bin/bash

# Set up ssh

apt install ssh &&
ssh-keygen -t rsa -b 4096 -C "<email>" &&
eval "$(ssh-agent -s)" &&
ssh-add ~/.ssh/id_rsa &&

apt install xclip &&
xclip -sel clip < ~/.ssh/id_rsa.pub

# Add this to your github keys.

# Set up git
apt install git &&

git config user.name "<name>"
git config user.email"<email>"

mkdir /home/<username>/Repositories/
cd /home/<username>/Repositories/

git clone git@github.com:rudsvar/DAT103.git
git clone git@github.com/rudsvar/INF102.git
git clone git@github.com/rudsvar/INF122.git
git clone git@github.com/st09303/https-github.com-marcbezem-INF102.git
