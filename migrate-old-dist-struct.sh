#!/bin/bash

for dirName in `ls`;
  do
    #for mac
    #matched=$(echo $dirName|egrep '^(\d+)(\.(\d+))+$');
    matched=$(echo $dirName|grep -P '^(\d+)(\.(\d+))+$');
    if [ $matched ]; then
        mv $matched `echo $matched | sed 's/^/v/'`;
    fi
done
