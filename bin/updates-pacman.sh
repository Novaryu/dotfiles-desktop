#!/bin/sh

if ! updates=$(checkupdates 2> /dev/null | wc -l ); then
    updates=0
fi

if [ "$updates" -ge 20 ]; then
    echo "📦 $updates"
else
    echo ""
fi
