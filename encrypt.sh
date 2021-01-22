#!/bin/bash
file=""
while getopts f:c: flag
do
    case "${flag}" in
        f) file=${OPTARG};;
    esac
done

if [ "$file" = "" ]
then echo "File name not setted add file name by argument -f"; exit
fi

out_file=$file".locked"
echo File $file will be locked into $out_file
openssl enc -aes-256-cbc -salt -in "$file" -out "$out_file"