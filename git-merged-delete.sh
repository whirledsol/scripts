#!/bin/bash

echo Removing branches merged into **$(git rev-parse --abbrev-ref HEAD)**
whitelist="(^\*|master|main|dev|develop|compare)"
git branch --merged | egrep -v $whitelist

read -p "Do you wish to remove these? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

git branch --merged | egrep -v $whitelist | xargs git branch -d
