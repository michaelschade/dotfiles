#!/bin/sh

brew update
brew upgrade
git pull
git submodule foreach git pull origin master
