#!/bin/bash

while getopts n:c: option
do 
    case "${option}"
        in
        nat)nation=${OPTARG};;
        cat)code=${OPTARG};;
    esac
done

echo "Nation : $nation"
echo "code   : $code"