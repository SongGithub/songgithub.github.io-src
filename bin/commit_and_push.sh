#!/usr/bin/env bash

set -x

git_msg="committed by robot, at "$(date '+%d/%m/%Y %H:%M:%S')
echo "$git_msg"

cd output
git add .
git commit -m "$git_msg"
git push -u origin master

cd ..
git add .
git commit -m "$git_msg"
git push -u origin master
