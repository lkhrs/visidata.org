#!/bin/bash

set -e

WWWSRC=$(pwd)
BLOG=$WWWSRC/blog
BUILD=$WWWSRC/_blog

BIN=$WWWSRC/bin

TMPDIR=$(mktemp -d)

mkdir -p "$BUILD"

for fn in 404.html favicon.ico robots.txt vdlogo.png main.css; do
    cp -R "$WWWSRC"/static/"$fn" "$BUILD"/
done

source "$BIN"/mkpage.sh

function build_blog() {
    # build index
    build_page . "$BLOG"/index.md "VisiData Blog"

    for postpath in $(find "$BLOG" -name '*.md'); do
        post=${postpath##$BLOG}
        postname=${post%.md}
        echo $postname
        build_page "$postname" "$postpath" "$postname"
    done
}

build_blog
mv $BUILD/index/ /tmp
