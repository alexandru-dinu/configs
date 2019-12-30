#!/bin/bash

root_dir=$(pwd)
to_delete=('__pycache__' '*.ipynb_checkpoints' '*.pyc' '*~' '*DS_Store')

do_clean () {
    for f in "${to_delete[@]}";
    do
        echo $f && find . -name "$f" | xargs rm -rf
    done

}

do_update () {
    for f in `ls -d -t $1/*.git | grep -v linux`
    do
        echo ">>> $f"
        cd $f

        case "$2" in
            status)
                git status
                ;;
            pull)
                git pull
                ;;
            *)
                echo "Unknown cmd"
        esac

        # git ls-files | xargs file | grep "ELF.*executable" | awk -F: '{print $1}' | xargs echo

        cd $root_dir
        perl -e 'print "-"x64 . "\n"'
    done
}


case "$1" in
    clean)
        do_clean
        ;;
    update)
        do_update "${@:2}"
        ;;
    *)
        echo "Unknown cmd"
        exit 1
esac
