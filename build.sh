#!/bin/bash
rm -f node_modules/markdown-resume/assets/css/*
cp source/_resume/resume.css node_modules/markdown-resume/assets/css/
node node_modules/markdown-resume/bin/md2resume source/_resume/resume.md
# Ugly
#node node_modules/markdown-resume/bin/md2resume --pdf resume.md
mv source/_resume/resume.html .deploy/index.html
# extglob is available but disabled by default since bash-2.02-alpha1, enabled by default since bash-4.1-alpha
shopt -s extglob
cp -r source/!(_*) .deploy/
