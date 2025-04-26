#!/bin/bash

set -e

for bluelink in $(cat ./bluelinks); do
    if [[ -L $bluelink ]]; then
        echo "$bluelink is already a link, aborting"
        exit 1
    fi

    mv $bluelink blue/$bluelink
    ln -s blue/$bluelink $bluelink

    echo "$bluelink is now a link"
done
