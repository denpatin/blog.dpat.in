#!/usr/bin/env bash

VERSION=3118

cd ~
rm -rf e2*
curl -s -O http://blogengine.ru/download/e2_distr_v$VERSION.zip
unzip e2*.zip -d ./e2_distr_v$VERSION
