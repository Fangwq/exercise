#!/bin/bash
echo 'the code aims to push code to github'
echo '=========='
echo "$1, $2, $3"
git add $x.$y
git ci -m "$z"
git push origin master
echo "=========="
echo "It is over!"

