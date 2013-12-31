#!/bin/sh -ex

VERSION="3.1.0"

rm -f "rsync"
rm -rf "rsync-$VERSION"
rm -f "rsync-$VERSION.tar.gz"

curl -O "http://rsync.samba.org/ftp/rsync/src/rsync-$VERSION.tar.gz"
tar -xf "rsync-$VERSION.tar.gz"
rm -f "rsync-$VERSION.tar.gz"

pushd "rsync-$VERSION"
./configure --with-included-zlib --with-included-popt  # Required to generate config.h
make -j4  # Required to generate rounding.h
popd

ln -sf "rsync-$VERSION" "rsync"
