#!/bin/bash

while getopts nat:cat: option
do 
    case "${option}"
        in
        nat)nation=${OPTARG};;
        cat)code=${OPTARG};;
    esac
done

echo "Nation : $nation"
echo "code   : $code"