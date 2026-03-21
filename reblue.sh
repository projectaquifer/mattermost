#!/bin/bash

set -e

for bluelink in $(cat ./bluelinks); do
    if [[ -L $bluelink ]]; then
        echo "$bluelink is already a link, aborting"
        exit 1
    fi

    mv $bluelink blue/$bluelink

    # compute the right relative path from the symlink's directory back to blue/
    linkdir=$(dirname "$bluelink")
    if [[ "$linkdir" == "." ]]; then
        ln -s "blue/$bluelink" "$bluelink"
    else
        depth=$(echo "$linkdir" | tr '/' '\n' | wc -l | tr -d ' ')
        prefix=$(printf '../%.0s' $(seq 1 $depth))
        ln -s "${prefix}blue/$bluelink" "$bluelink"
    fi

    echo "$bluelink is now a link"
done
