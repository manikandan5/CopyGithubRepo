#!/bin/bash
if [$2 = ""]; then
    echo "Invalid arguments. Expected input : $0 <old-repo> <new-repo>"
    exit 1
fi
REPOA=$1
REPOB=$2
echo $REPOA
echo $REPOB
git clone $REPOA old-dir
cd old-dir
git remote rm origin
git add .
git commit
cd ..
git clone $REPOB new-dir
cd new-dir
git remote add repo-A ../old-dir
git pull repo-A master --allow-unrelated-histories
git remote rm repo-A
git add --a
git commit -m "Pushing to new branch"
git push
cd ..
rm -rf old-dir
rm -rf new-dir
