#!/bin/bash

# link all files without dots in their name
for file in `ls | sed "/\./d"`
do
  ln -sf $(pwd)/$file ~/.$file
done

# link sublime config
ln -sf ~/.sublime ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User/Preferences.sublime-settings

# file extensions
duti ~/.duti

# links to home and root
rm ~/Desktop/home && ln -sf ~ ~/Desktop/home
rm ~/root && ln -sf / ~/root