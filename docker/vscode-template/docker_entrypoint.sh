#!/bin/bash
set -e

if [ $# -eq 0 ]
  then
    code-server1.408-vsc1.32.0-linux-x64/code-server --allow-http --no-auth --data-dir /data /code
  else
    exec "$@"
fi
