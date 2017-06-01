#!/bin/bash

# setup.sh script template

function installp
{
    cp ${ex_paths[0]} ${ex_paths[1]} && chmod a+x ${ex_paths[1]}
    cp -r ${template_paths[0]} ${template_paths[1]}
    
    echo "Installed..."

    return 0
}

function uninstallp
{
    # add uninstall code
    rm ${ex_paths[1]}
    
    echo "Uninstalled..."
    
    return 0
}

function prog_usage
{
    echo "usage: bash setup.sh install | uninstall"
}

function main
{
    declare -ra ex_paths=(srcr.sh /usr/local/bin/srcr)
    declare -r template_paths=(templates "$HOME/.srcr")

    # add any other constants or setup variables 
    if [ $# -eq 0 ]; then
        prog_usage
        exit 1
    fi
    
    case "$1" in
        "install"   )
            if ! installp; then
                exit 1
            fi
            ;;
        "uninstall" )
            if ! uninstallp; then
                exit 1
            fi
            ;;
        * )
            prog_usage
            exit 1
    esac
    
    exit 0
}

main "$@"

