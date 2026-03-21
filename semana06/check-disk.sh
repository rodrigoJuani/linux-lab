#!/bin/bash

# Reutilizar función log()
log() {
    local nivel="$1"
    local mensaje="$2"
    local timestamp
    timestamp=$(date '+%Y-%m-%d %H:%M:%S')

    printf "[%s] [%-7s] %s\n" "$timestamp" "$nivel" "$mensaje"
}

log "INFO" "Verificando uso de disco..."

df -h | tail -n +2 | while read -r line; do
    uso=$(echo "$line" | awk '{print $5}' | tr -d '%')
    particion=$(echo "$line" | awk '{print $6}')

    if [ "$uso" -gt 90 ]; then
        log "ERROR" "Partición $particion en $uso% de uso"
    elif [ "$uso" -gt 75 ]; then
        log "WARNING" "Partición $particion en $uso% de uso"
    else
        log "OK" "Partición $particion en $uso% de uso"
    fi
done
