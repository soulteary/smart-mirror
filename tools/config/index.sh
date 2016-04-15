#!/bin/bash

# /**
# * Smart Mirror
# *
# * @author soulteary@gmail.com
# * @desc   config, global vars.
# **/

PROTO_PREFIX='s';

DOWNLOAD_VERSION_FOR_SOURCE='';

DOWNLOAD_VERSION_FOR_MAC='';

DOWNLOAD_VERSION_FOR_LINUX='';
DOWNLOAD_VERSION_FOR_LINUX_64='';
DOWNLOAD_VERSION_FOR_LINUX_86='';

DOWNLOAD_VERSION_FOR_SUNOS='';
DOWNLOAD_VERSION_FOR_SUNOS_86='';
DOWNLOAD_VERSION_FOR_SUNOS_64='';

DOWNLOAD_VERSION_FOR_ARM='';
DOWNLOAD_VERSION_FOR_ARM_64='';
DOWNLOAD_VERSION_FOR_ARM_v6='';
DOWNLOAD_VERSION_FOR_ARM_v7='';

for ARGV in "$@"
    do
        case $ARGV in
            '--without-ssl')
                PROTO_PREFIX='';
            ;;
            '--for-mac')
                DOWNLOAD_VERSION_FOR_MAC='1';
            ;;
            '--for-linux')
                DOWNLOAD_VERSION_FOR_LINUX='1';
            ;;
            '--for-linux-x86')
                DOWNLOAD_VERSION_FOR_LINUX_86='1';
            ;;
            '--for-linux-x64')
                DOWNLOAD_VERSION_FOR_LINUX_64='1';
            ;;
            '--for-sunos')
                DOWNLOAD_VERSION_FOR_SUNOS='1';
            ;;
            '--for-sunos-x86')
                DOWNLOAD_VERSION_FOR_SUNOS_86='1';
            ;;
            '--for-sunos-x64')
                DOWNLOAD_VERSION_FOR_SUNOS_64='1';
            ;;
            '--for-source')
                DOWNLOAD_VERSION_FOR_SOURCE='1';
            ;;
            '--for-arm')
                DOWNLOAD_VERSION_FOR_ARM='1';
            ;;
            '--for-arm-x64')
                DOWNLOAD_VERSION_FOR_ARM_64='1';
            ;;
            '--for-arm-v6')
                DOWNLOAD_VERSION_FOR_ARM_v6='1';
            ;;
            '--for-arm-v7')
                DOWNLOAD_VERSION_FOR_ARM_v7='1';
            ;;
        esac
done

WEBSITE_IOJS="http${PROTO_PREFIX}://iojs.org/";
WEBSITE_NODEJS="http${PROTO_PREFIX}://nodejs.org/";

BASE_DIST_URL_IOJS="${WEBSITE_IOJS}dist/"
BASE_DIST_URL_NODEJS="${WEBSITE_NODEJS}dist/"
