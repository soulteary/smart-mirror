#!/bin/bash

VERSION_LIST=$(get_version $WEBSITE_IOJS);
VERSION_COUNT=$(echo -ne "$VERSION_LIST" | wc -l);

echo $VERSION_COUNT;

echo -en "$VERSION_LIST" | while read VERSION; do

    echo $VERSION;

    tgz="v${version}/${NAME}-v${version}.tar.gz"
    VD="${DIST}/v${version}"


#mkdir -p "$VD"
#pushd "$VD"
#  BASEURL="$BASEDIR/v${version}"
#  SHASUMURL="$BASEURL/SHASUMS256.txt"
#  SHASUMFILE="SHASUMS256.txt"
#  wget -N "$SHASUMURL"
#  wget -N "$SHASUMURL.asc"
#  wget -N "$SHASUMURL.gpg"
#  $SUM -c "$SHASUMFILE" 2>/dev/null | grep "FAILED" | cut -d':' -f1 | while read line; do
#  mkdir -p $(dirname "$line")
#  wget -O "$line" "$BASEURL/$line"
#  done
#popd


done
