#!/bin/bash

for bluelink in $(cat ./bluelinks); do
    if [[ ! -L $bluelink ]]; then
        echo "$bluelink is not a link, aborting"
        exit 1
    fi

    echo "Replacing $bluelink link with contents of blue/$bluelink"
    rm $bluelink
    cp -R blue/$bluelink $bluelink

    echo "Removing blue/$bluelink and replacing with a link"
    rm -r blue/$bluelink
    ln -s blue/$bluelink ./$bluelink
done
