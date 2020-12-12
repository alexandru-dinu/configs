#!/bin/bash

rsync -r --ignore-existing --verbose $1 $2
