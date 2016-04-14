#!/bin/bash

PROTO_PREFIX='s';

for ARGV in "$@"
    do
        case $ARGV in
            '--without-ssl')
                PROTO_PREFIX='';
            ;;
        esac
done

WEBSITE_IOJS="http${PROTO_PREFIX}://iojs.org/";
WEBSITE_NODEJS="http${PROTO_PREFIX}://nodejs.org/";

BASE_DIST_URL_IOJS="${WEBSITE_IOJS}dist/"
BASE_DIST_URL_NODEJS="${WEBSITE_NODEJS}dist/"
