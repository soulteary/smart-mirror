#!/usr/bin/env bash
# /**
# *
# *
# **/

source './tools/config/index.sh';
source './tools/util/index.sh';

echo $PWD;

ACTION=$1;
MIRROR_RELEASE=$2;

case $ACTION in
    'create-mirror')
		echo "[INFO] Try to create $MIRROR_RELEASE.js mirror";
		[ -s "${PWD}/tools/create-mirror/${MIRROR_RELEASE}/index.sh" ] && . "${PWD}/tools/create-mirror/${MIRROR_RELEASE}/index.sh" && exit 0;
        echo "[ERROR] Not support create \`${MIRROR_RELEASE}\` mirror yet.";
        exit 1;
    ;;
    *)
        echo 'useage: ./jsbrick.sh CMD NODE_RELEASE';
        exit 2;
esac
