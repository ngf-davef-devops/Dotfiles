#!/usr/bin/env bash

while read filename; do
    ln -sfn ~/development/Dotfiles/"$filename" ~/"$filename"
done < ~/development/Dotfiles/filelist.txt
