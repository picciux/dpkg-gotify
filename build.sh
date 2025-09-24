#! /bin/bash

MYPATH=$(dirname $0)

set -e

# Getting binary
wget https://github.com/gotify/server/releases/download/v2.7.3/gotify-linux-arm64.zip
unzip gotify-linux-arm64.zip
mkdir -p $MYPATH/pkgroot/usr/bin
mv gotify-linux-arm64 $MYPATH/pkgroot/usr/bin/gotify
chmod 755 $MYPATH/pkgroot/usr/bin/gotify

# Gzipping changelog
CL=pkgroot/usr/share/doc/gotify/changelog.Debian
cat $CL | gzip -9 > $CL.gz
rm $CL

dpkg-deb --build $MYPATH/pkgroot $MYPATH/../

# Cleanup
rm -rf LICENSE licenses gotify-linux-arm64.zip
rm pkgroot/usr/bin/gotify
gunzip $CL.gz
