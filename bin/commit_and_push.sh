#!/usr/bin/env bash

set -ex

cd output
git add .
git commit -m 'committed by git robot'
git push -u origin master

cd ..
git add .
git commit -m 'committed by git robot'
git push -u origin master