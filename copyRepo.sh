#!/bin/bash
if [$2 = ""]; then
    echo "Invalid arguments. Expected input : $0 <old-repo> <new-repo>"
    exit 1
fi
git clone $1 old-dir
cd old-dir
git remote rm origin
git add .
git commit
cd ..
git clone $2 new-dir
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
