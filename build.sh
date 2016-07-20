#!/bin/bash

set -e

rm -f node_modules/markdown-resume/assets/css/*
cp source/_resume/resume.css node_modules/markdown-resume/assets/css/
# For icon
cp source/_resume/template.html node_modules/markdown-resume/assets/templates/default.html
node node_modules/markdown-resume/bin/md2resume source/_resume/resume.md
node node_modules/markdown-resume/bin/md2resume source/_resume/resume-en.md
# Ugly
#node node_modules/markdown-resume/bin/md2resume --pdf resume.md
mkdir -p .deploy/
mv source/_resume/resume.html .deploy/index.html
mkdir -p .deploy/en/
mv source/_resume/resume-en.html .deploy/en/index.html
# extglob is available but disabled by default since bash-2.02-alpha1, enabled by default since bash-4.1-alpha
shopt -s extglob
cp -r source/!(_*) .deploy/
