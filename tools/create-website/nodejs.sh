#!/usr/bin/env bash

wget --mirror --adjust-extension --page-requisites --no-parent --recursive --domains=nodejs.org -e robots=off -v -S https://nodejs.org/dist/