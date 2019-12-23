#!/bin/bash
set -e

if [ $# -eq 0 ]
    then
        code-server2.1692-vsc1.39.2-linux-x86_64/code-server --allow-http --no-auth --data-dir /data /code
    else
        exec "$@"
fi
