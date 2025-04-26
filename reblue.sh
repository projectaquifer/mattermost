#!/bin/bash

for bluelink in $(cat ./bluelinks); do
    if [[ -L $bluelink ]]; then
        echo "$bluelink is already a link, aborting"
        exit 1
    fi

    echo "Moving contents of $bluelink to blue/$bluelink"
    rm blue/$bluelink
    mv $bluelink blue/$bluelink

    echo "Replacing $bluelink with symlink"
    rm -r $bluelink
    ln -s blue/$bluelink $bluelink
done
