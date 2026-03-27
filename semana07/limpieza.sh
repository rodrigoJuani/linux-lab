#!/bin/bash

TMP_DIR="/tmp"

logs=$(find "$TMP_DIR" -type f -name "*.log" -mtime +7)
tmps=$(find "$TMP_DIR" -type f -name "*.tmp" -mtime +7)

count_log=0
count_tmp=0

for f in $logs; do
    count_log=$((count_log + 1))
done

for f in $tmps; do
    count_tmp=$((count_tmp + 1))
done

find "$TMP_DIR" -type f \( -name "*.log" -o -name "*.tmp" \) -mtime +7 | xargs rm -f

echo "Archivos .log eliminados: $count_log"
echo "Archivos .tmp eliminados: $count_tmp"
