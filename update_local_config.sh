#!/usr/bin/env bash

while read filename; do
    ln -sf ~/Dotfiles/"$filename" ~/"$filename"
done < filelist.txt
