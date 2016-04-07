#!/usr/bin/env bash

check_exist() {
    type "$1" > /dev/null 2>&1
}

file_download() {
    if check_exist "curl"; then
        echo "[INFO] Try to download: ${*}";
        curl -q $*
    elif check_exist "wget"; then
        ARGS=$(echo "$*" | command sed -e 's/--progress-bar /--progress=bar /' \
        -e 's/-L //' \
        -e 's/-I /--server-response /' \
        -e 's/-s /-q /' \
        -e 's/-o /-O /' \
        -e 's/-C - /-c /')

        echo "[INFO] Try to download: ${ARGS}";
        wget $ARGS
    else
        echo 'NEED INSTALL \`curl\` or \`wget\`.'
        exit 1;
    fi
}

get_version() {
    file_download "$1/dist/index.tab" | grep -v '^ver' | grep '^v' | awk '{print $1}' | cut -c 2- | grep -v '^$'
}