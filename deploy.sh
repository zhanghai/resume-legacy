#!/bin/bash
set -e
./build.sh
if [[ ! -d .deploy ]]; then
    if [[ -e .deploy ]]; then
        echo 'ERROR: .deploy is not a directory'
        exit 1
    fi
    mkdir .deploy
    cd .deploy
    git init
    git symbolic-ref HEAD refs/heads/gh-pages
    git remote add origin git@github.com:DreaminginCodeZH/resume.zhanghai.me.git
else
    cd .deploy
fi
cp ../CNAME ../favicon.png ../index.html ../404.html ./
git add -A
git commit -m "Resume updated: $(date -R)"
git push -u origin gh-pages
