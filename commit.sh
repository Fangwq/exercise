#!/bin/bash
echo 'the code aims to push code to github'
echo '=========='
echo "$1, $2, $3"
git add $1.$2
git ci -m '$3'
git push origin master
echo "=========="
echo "It is over!"

