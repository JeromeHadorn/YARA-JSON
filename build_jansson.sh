#!/bin/bash

# Installing & configure Libjansson
DIR="./bin/jansson"
if [ -d "$DIR" ]; then
    echo "'$DIR' already exists. Using existing directory."
else
    echo "Warning: '$DIR' NOT found."
    git clone https://github.com/akheron/jansson $DIR
    cd ./bin/jansson
    autoreconf -vi --force
    ./configure
    make 
    make install
fi
