#!/bin/bash

# TODO: use pwd?

# Installing & configuring YARA
BUILD_DIR="./bin/yara"
if [ -d "$BUILD_DIR" ]; then
    echo "'$BUILD_DIR' already exists. Using existing directory."
else
    echo "Warning: '$BUILD_DIR' NOT found."
    git clone https://github.com/VirusTotal/yara.git $BUILD_DIR
fi


TARGET_DIR="./bin/yara/libyara/modules/json"
if [ -d "$TARGET_DIR" ]; then
    echo "'$TARGET_DIR' already exists. Using existing directory."
else
    mkdir ./bin/yara/libyara/modules/json
fi


echo "Copying json.c into libyara..."
cp json.c $TARGET_DIR/json.c


FILE="./bin/yara/libyara/modules/module_list"
APPEND_VALUE="MODULE(json)"

if grep -q "$APPEND_VALUE" "$FILE"; then
    echo "Already added module to module list..."
  else
    echo "$APPEND_VALUE" >> $FILE
fi

FILE="./bin/yara/libyara/Makefile.am"
APPEND_VALUE="MODULES += modules/json/json.c"

if grep -q "$APPEND_VALUE" "$FILE"; then
    echo "Already added module link to Makefile.am..."
  else
    echo $APPEND_VALUE >> $FILE
fi



echo 'Building YARA...'
cd $BUILD_DIR
./bootstrap.sh
./configure --with-crypto --enable-cuckoo
make
make install

