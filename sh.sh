#!/bin/bash

while getopts n:c: option
do 
    case "${option}"
        in
        n)nation=${OPTARG};;
        c)code=${OPTARG};;
    esac
done

echo "Nation : $nation"
echo "code   : $code"