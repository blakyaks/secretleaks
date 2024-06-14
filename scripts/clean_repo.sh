#!/bin/bash
cd /c/source/
git clone --mirror git@github.com:blakyaks/secretleaks.git
tar -czvf secretleaks.tar.gz secretleaks.git/

echo "DUMMY2A93A28E9999936C89221856EC98B8FFC" > /c/source/secrets.txt
echo "1tUm636uS1yOEcfP5pvfqJ/ml36mF7AkyHsEU0IU" >> /c/source/secrets.txt

bfg --replace-text secrets.txt secretleaks.git
cd secretleaks.git
git reflog expire --expire=now --all && git gc --prune=now --aggressive
## IMPORTANT FOR A REAL CLEAN - but ommittting from example script
# git push
Echo "git push ommitted from example. But MUST be done on a real clean"
rm /c/source/secrets.txt