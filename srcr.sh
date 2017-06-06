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
                echo "srcr: could not find template for the \"$extension\" extension on"
                echo "    "$file
                return 1
            fi
            cat "$templates_dir/$extension.$extension" | \
                sed -e "s/%script_title%/$script_title/g" | \
                sed -e "s/%author%/$author/g" | \
                sed -e "s/%date%/$dt/g" > $file
        else
            echo "srcr: no extension specified for $file"
            return 1
        fi
    done
}

function prog_usage
{
    echo "usage: srcr files..."
}

function main
{
    if [ $# -eq 0 ]; then
        prog_usage
        exit 1
    fi
    
    create_source "$@"

    exit 0
}

main "$@"


