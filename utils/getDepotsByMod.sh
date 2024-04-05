#!/bin/bash

case "$1" in
    "valve")
        echo "1 4 1006"
        ;;
    "cstrike")
        echo "1 4 1006 11"
        ;;
    "czero")
        echo "1 4 1006 11 81"
        ;;
    "dod")
        echo "1 4 1006 31"
        ;;
    "gearbox")
        echo "1 4 1006 51"
        ;;
    "tfc")
        echo "1 4 1006 21"
        ;;
    "ricochet")
        echo "1 4 1006 61"
        ;;
    *)
        echo "Invalid argument \"$1\""
        exit 1
        ;;
esac