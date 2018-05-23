#!/usr/bin/env bash

set -x

git_msg="committed by robot, at Melbourne time ""$(TZ=UTC-10 date '+%d/%m/%Y %H:%M:%S')"
echo "commit msg= ""$git_msg"
GH_TARGET_REPO=$1

git_ops_submodule() {
  git add .
  git commit -m "$git_msg"
  git push origin master --force-with-lease
}

reset_origin() {
  GH_REPO=$1
  git remote set-url origin "$GH_REPO"
}

cd output
git checkout master
cd ..
make publish
cd output

reset_origin "$GH_TARGET_REPO"
git_ops_submodule
