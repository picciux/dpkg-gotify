#! /bin/bash

MYPATH=$(dirname $0)

set -e

# Getting binary
wget https://github.com/gotify/server/releases/download/v2.7.3/gotify-linux-arm64.zip
unzip gotify-linux-arm64.zip
mv gotify-linux-arm64 $MYPATH/pkgroot/usr/bin/gotify
chmod 755 $MYPATH/pkgroot/usr/bin/gotify
rm -rf LICENSE licenses gotify-linux-arm64.zip

dpkg-deb --build $MYPATH/pkgroot $MYPATH/../

