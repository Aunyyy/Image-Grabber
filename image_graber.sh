#!/bin/bash
url=https://www.etsy.com/

curl -o "etsy.html" $url

grep -Po "\"https.*?jpg\"" etsy.html | grep -Po "https.*?jpg" > image_holder.txt

mkdir -p images
cd images

n=1
while read line; do
if [ ! -e "filename" ]; then
echo "File Already Exists"
curl -o "image_$n.jpg" $line
fi

n=$((n+1))

if [ $((n%2)) -eq 0 ]
then
  sleep 10
fi
done<  "../image_holder.txt"
