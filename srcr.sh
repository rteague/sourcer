#!/bin/bash

#
# Sourcer
# by Rashaud Teague
# Wed May 16 2017
##

function create_source
{
    declare -r templates_dir="$HOME/.srcr/templates"
    local author=${SRCR_AUTHOR:-$USER}
    for file in "$@"; do
        local script_title=${file##*/}
        local extension=$(echo $file | grep -oE "\.[a-z]+$" | grep -oE "[a-z]+")
        local dt=$(date "+%a %B %d %Y")
        if [ "$extension" != "" ]; then
            if [ ! -f "$templates_dir/$extension.$extension" ]; then
                echo "$PROG: could not find template for the \"$extension\" extension on"
                echo "    "$file
                return 1
            fi
            cat "$templates_dir/$extension.$extension" | sed -e "s/%script_title%/$script_title/g" | sed -e "s/%author%/$author/g" | sed -e "s/%date%/$dt/g" > $file
        else
            echo "$PROG: no extension specified for $file"
            return 1
        fi
    done
}

function main
{
    declare -r PROG="srcr"
    declare -r USAGE="usage: $PROG files..."

    if [ $# -eq 0 ]; then
        echo $USAGE
        exit 1
    fi
    
    create_source "$@"

    exit 0
}

main "$@"


