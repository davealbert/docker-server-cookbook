#!/bin/bash

# This runs as root on the server

chef_binary=$(which chef-solo)

# Are we on a vanilla system?
if ! test -f "$chef_binary"; then
    export DEBIAN_FRONTEND=noninteractive
    # Upgrade headlessly (this is only safe-ish on vanilla systems)
    aptitude update &&
    apt-get -o Dpkg::Options::="--force-confnew" \
        --force-yes -fuy dist-upgrade &&
    # Install Ruby and Chef
    aptitude install -y ruby1.9.1 ruby1.9.1-dev make &&
    aptitude install -y ruby-net-ssh ruby-net-ssh-multi ruby-net-ssh-gateway &&
    sudo gem1.9.1 install --no-rdoc --no-ri chef --version 0.10.0
fi &&

"$chef_binary" -c solo.rb -j solo.json

mkdir ~/.ssh
cp local/id_rsa ~/.ssh/

curl --digest --user $username:$password https://bitbucket.org/davealbert/moodocityweb/get/v1.0.0.tar.bz2 -O
bunzip2 v1.0.0.tar.bz2
rm -rf web
mkdir web && tar xf v1.0.0.tar -C web --strip-components 1

