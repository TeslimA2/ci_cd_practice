#!/usr/bin/env bash

set -u

repository_root=$(git rev-parse --show-toplevel)
cd "$repository_root"

mkdir -p output

PYTHONPATH=src \
python -m pytest \
    tests/unit \
    --quiet \
    --junitxml=output/unit-tests.xml
