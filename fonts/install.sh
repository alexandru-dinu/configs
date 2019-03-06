#!/bin/bash

DIR="$HOME/.local/share/fonts"

rm -rf $DIR && mkdir -p $DIR
cp -r SourceCodePro $DIR
