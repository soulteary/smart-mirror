#!/usr/bin/env bash

wget --mirror --adjust-extension --page-requisites --no-parent --recursive --domains=iojs.org -e robots=off -v -S https://iojs.org/dist/