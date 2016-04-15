#!/bin/bash

# /**
# * Smart Mirror
# *
# * @author soulteary@gmail.com
# * @desc   create Node.js mirror.
# **/

BASE_DIR="${PWD}/dist/${MIRROR_RELEASE}";
mkdir -p "$BASE_DIR";

VERSION_LIST=$(get_version $WEBSITE_NODEJS);
VERSION_COUNT=$(echo -ne "$VERSION_LIST" | wc -l);

echo "[INFO] Get total version: $VERSION_COUNT";

echo -ne "$VERSION_LIST">pipe

NODE_VERSION_FILTERED="";

echo "[INFO] Filter node.js version:"

while read VERSION; do
    if check_node_version $VERSION ; then
        NODE_VERSION_FILTERED="$NODE_VERSION_FILTERED${VERSION}""\n";
    else
      continue;
    fi
done < pipe
rm pipe;

VERSION_LIST=$(echo -ne ${NODE_VERSION_FILTERED} | sort -u);
VERSION_COUNT=$(echo -ne "$VERSION_LIST" | wc -l);

echo "[INFO] Get filtered version: $VERSION_COUNT";

echo -ne "${VERSION_LIST}" | while read VERSION; do

CURRENT_VERSION="${BASE_DIR}/${VERSION}";

    mkdir -p "${CURRENT_VERSION}";
    pushd "${CURRENT_VERSION}";

        SHASUMURL="${BASE_DIST_URL_NODEJS}v${VERSION}/SHASUMS256.txt"
        SHASUMFILE="SHASUMS256.txt"
        SHASUMFILE_ASC="SHASUMS256.txt.asc"

        SHASUM=;
        if check_exist "shasum"; then
            SHASUM=shasum
        fi

        wget -N "$SHASUMURL"
        wget -N "$SHASUMURL.asc"
        wget -N "$SHASUMURL.gpg"

        echo $(cat "$SHASUMFILE" | grep -E ".{64}\s+node-v${VERSION}.(tar.gz)")>"new-hash";

        $SHASUM -a256 -c "$SHASUMFILE" 2>/dev/null | grep "OK" | cut -d':' -f1 | while read line; do
            echo "${line},######";
            mkdir -p $(dirname "$line")
            wget -O "$line" "$BASEURL/$line"
        done

        #gpg --verify "${SHASUMFILE}" 2>/dev/null | grep '完好的签名' | while read line; do
        #    echo '[OK!] ---------------------'
        #done

        #todo async download queue
        lazy_download "${BASE_DIST_URL_NODEJS}/v${VERSION}/node-v${VERSION}.tar.gz" "node-v${VERSION}.tar.gz" "${CURRENT_VERSION}"
    popd;
done

