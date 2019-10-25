#!/usr/bin/env bash

while read filename; do
    ln -sfn ~/Dotfiles/"$filename" ~/"$filename"
done < filelist.txt
