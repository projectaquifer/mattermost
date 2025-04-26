#!/bin/bash

set -e

for bluelink in $(cat ./bluelinks); do
    if [[ ! -L $bluelink ]]; then
        echo "$bluelink is not a link, aborting"
        exit 1
    fi

    rm $bluelink
    mv blue/$bluelink/ $bluelink

    echo "$bluelink is now a directory"
done
