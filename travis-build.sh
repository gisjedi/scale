#!/usr/bin/env bash

set -e

root=$(dirname $0)
cd $root
root=`pwd`

cd $root/scale-ui
./travis-build.sh

cd $root/scale
coverage run --source='.' manage.py test --parallel
cd $root
codecov
cd $root/scale/docs
make code_docs html
./push-docs.sh
