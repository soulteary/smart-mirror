#!/usr/bin/env bash

VERSION_LIST=$(get_version $WEBSITE_IOJS | wc -l);


echo $VERSION_LIST;
echo '###';

VERSION_COUNT=$(echo $VERSION_LIST | wc -l);

echo $VERSION_COUNT;
echo '###';

echo $VERSION_LIST | while read version; do


tgz="v${version}/${NAME}-v${version}.tar.gz"
VD="${DIST}/v${version}"

echo $tgz;
echo $VD;



done



echo $WEBSITE_IOJS;

