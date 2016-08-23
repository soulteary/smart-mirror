#!/bin/bash

if [[ "$MIRROR_RELEASE"="node" ]]; then

    WITH_ALL_DIST='1';

    WITHOUT_0_x='';

    WITHOUT_0_10='';
    WITHOUT_GT_0_10='';
    WITHOUT_GT_0_10_40='';

    WITHOUT_0_11='';
    WITHOUT_GT_0_11='';

    WITHOUT_0_12='';
    WITHOUT_GT_0_12_10='';

    WITHOUT_4_x='';
    WITHOUT_GT_4_x='';

    WITHOUT_5_x='';
    WITHOUT_GT_5_x='';

    WITHOUT_6_x='';
    WITHOUT_GT_6_x='';

    for ARGV in "$@"
        do
            case $ARGV in
                '--all-dist')
                    WITH_ALL_DIST='1';
                    break;
                ;;
                '--without-0.x')
                    WITHOUT_0_x='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-0.12')
                    WITHOUT_0_12='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-gt-0.12.10')
                    WITHOUT_GT_0_12_10='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-0.11')
                    WITHOUT_0_11='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-gt-0.11')
                    WITHOUT_GT_0_11='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-0.10')
                    WITHOUT_0_10='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-gt-0.10.40')
                    WITHOUT_GT_0_10_40='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-gt-0.10')
                    WITHOUT_GT_0_10='1';
                    WITH_ALL_DIST='';
                ;;

                '--without-4.x')
                    WITHOUT_4_x='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-gt-4.x')
                    WITHOUT_GT_4_x='1';
                    WITH_ALL_DIST='';
                ;;

                '--without-5.x')
                    WITHOUT_5_x='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-gt-5.x')
                    WITHOUT_GT_5_x='1';
                    WITH_ALL_DIST='';
                ;;

                '--without-6.x')
                    WITHOUT_6_x='1';
                    WITH_ALL_DIST='';
                ;;
                '--without-gt-6.x')
                    WITHOUT_GT_6_x='1';
                    WITH_ALL_DIST='';
                ;;

            esac
    done
fi;


check_exist() {
    type "$1" > /dev/null 2>&1;
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


check_node_version() {
    local ver=$1
    IFS=. read a b c <<< "$ver"

    if [[ -n $WITH_ALL_DIST ]]; then
        return 0;
    fi

    if [[ "0" = "$a" ]]; then
        if [[ -n $WITHOUT_0_x ]]; then
            return 1;
        fi;

        if [[ -n $WITHOUT_GT_4_x ]]; then
            return 1;
        fi;

        if [[ -n $WITHOUT_GT_5_x ]]; then
            return 1;
        fi;

        if [[ -n $WITHOUT_GT_6_x ]]; then
            return 1;
        fi;

        if [[ -n $WITHOUT_GT_0_10 ]]; then
            if [[ "10" -gt "$b" ]]; then
                return 1;
            fi
        fi;


        if [[ -n $WITHOUT_0_10 ]]; then
            if [[ "10" = "$b" ]]; then
                return 1;
            fi
        fi;

        if [[ -n $WITHOUT_GT_0_10_40 ]]; then
            if [[ "10" = "$b" ]]; then
                if [[ "40" -gt "$c" ]]; then
                    return 1;
                fi
            elif [[ "10" -gt "$b" ]]; then
                return 1;
            fi
        fi;

        if [[ -n $WITHOUT_0_11 ]]; then
            if [[ "11" = "$b" ]]; then
                return 1;
            fi
        fi;

        if [[ -n $WITHOUT_GT_0_11 ]]; then
            if [[ "11" -gt "$b" ]]; then
                return 1;
            fi
        fi;

        if [[ -n $WITHOUT_0_12 ]]; then
            if [[ "12" = "$b" ]]; then
                return 1;
            fi
        fi;

        if [[ -n $WITHOUT_GT_0_12_10 ]]; then
            if [[ "12" = "$b" ]]; then
                if [[ "10" -gt "$c" ]]; then
                    return 1;
                fi
            elif [[ "12" -gt "$b" ]]; then
                return 1;
            fi
        fi;
    fi

    if [[ "4" = "$a" ]]; then
        if [[ -n $WITHOUT_GT_6_x ]]; then
            return 1;
        fi;

        if [[ -n $WITHOUT_GT_5_x ]]; then
            return 1;
        fi;

        if [[ -n $WITHOUT_4_x ]]; then
            return 1;
        fi;
    fi

    if [[ "5" = "$a" ]]; then
        if [[ -n $WITHOUT_GT_6_x ]]; then
            return 1;
        fi;

        if [[ -n $WITHOUT_5_x ]]; then
            return 1;
        fi;
    fi

    if [[ "6" = "$a" ]]; then
        if [[ -n $WITHOUT_6_x ]]; then
            return 1;
        fi;
    fi



  return 0;
}


lazy_download(){
    local src=$1;
    local dist=$2;
    local baseDir=$3;

    local baseDirPath='';

    if [ -f "${dist}" ]; then
        echo "[INFO] file ${dist} already exist"
    else
        echo "[INFO] Downloading ${dist}..."

        if [[ $baseDir ]]; then
            baseDirPath="${baseDir}/";
        fi

        file_download  -s "${src}" -o "${baseDirPath}${dist}" || {
            echo >&2 "[ERROR] Failed to download '${baseDirPath}${dist}'"
            return 1
        }
    fi
}

