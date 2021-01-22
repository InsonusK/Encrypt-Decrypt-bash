#!/bin/bash

file=""
out=""
while getopts f:o: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
        o) out=${OPTARG};;
    esac
done

regex=".locked$"

if [ "$file" = "" ]
then echo "File name not setted add file name by argument -f"; exit
fi

if [ "$out" = "" ]
then echo "Output file name not setted add name by argument -o"; exit
fi

echo File $file will be unlocked into $out
openssl enc -d -aes-256-cbc -in "$file" -out "$out"