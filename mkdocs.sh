#!/bin/sh

if [ $(which mkdocs) ]; then
    echo "Already installed mkdocs"
else
    echo "you must install mkdocs brefore using this script!"
    exit
fi
if [ -e "../mdnoteread" ]; then
    echo "already mkdocs initialized"
else
    mkdocs new mdnoteread
    cd ../MDnotes
fi
rm -r "../mdnoteread/docs" || echo "Failed delete docs dir."
ln -s ./ ../mdnoteread/docs
