#!/bin/bash

VNU_JAR="vnu.jar"

mapfile -t URLS < urls.txt

if [ ! -f "$VNU_JAR" ]; then
    echo "Помилка: vnu.jar не знайдено"
    exit 1
fi

> output.txt

for url in "${URLS[@]}"
do
	java -jar "$VNU_JAR" "$url" >> output.txt 2>&1
done

grep "error" output.txt > bucket.report

