#!/bin/bash

for dirName in `ls`;
  do
    matched=$(echo $dirName|egrep '^(\d+)(\.(\d+))+$');
    if [ $matched ]; then
        mv $matched `echo $matched | sed 's/^/v/'`;
    fi
done
