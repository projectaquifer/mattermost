#!/bin/bash

set -ex

for bluelink in $(cat ./bluelinks); do
    if [[ ! -L $bluelink ]]; then
        echo "$bluelink is not a link, aborting"
        exit 1
    fi

    echo "Replacing $bluelink link with contents of blue/$bluelink"
    rm $bluelink
    mv blue/$bluelink/ $bluelink

    echo "Add link from blue/$bluelink"
    ln -s $bluelink blue/$bluelink
done
