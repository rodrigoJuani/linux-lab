#!/bin/bash

# monitor.sh - Monitor de recursos del sistema
# Semana 7: Ciclos en Bash
# Uso: ./monitor.sh [--intervalo N] [--max N]
#      [--umbral-disco N] [--umbral-ram N]

readonly VERSION="1.0.0"
LOGFILE="monitor.log"

UMBRAL_DISCO=80
UMBRAL_RAM=85
INTERVALO=10
MAX_ITER=0

uso() {
    echo "Uso: $0 [opciones]"
    echo " --intervalo N Segundos entre iteraciones"
    echo " --max N Max. iteraciones (0=sin limite)"
    echo " --umbral-disco N Alerta de disco en %"
    echo " --umbral-ram N Alerta de RAM en %"
    echo " --version Version"
    echo " --log RUTA Archivo de log personalizado"
    echo " --historial Mostrar promedio de uso desde el log"
    exit 2
}

uso_disco() {
    df / | awk 'NR==2 { gsub(/%/,"",$5); print $5 }'
}

uso_ram() {
    free | awk '/^Mem:/ {
        printf "%.0f", ($3 / $2) * 100
    }'
}

carga_cpu() {
    uptime | awk -F 'load average: ' '{ print $2 }' \
    | awk '{ gsub(/,/,"",$1); print $1 }'
}
uso_red() {
    local rx=0
    local tx=0

    while IFS= read -r linea; do
        case "$linea" in
            *:*)
                iface=$(echo "$linea" | awk -F ':' '{print $1}' | xargs)
                if [ "$iface" != "lo" ]; then
                    rx=$(echo "$linea" | awk '{print $2}')
                    tx=$(echo "$linea" | awk '{print $10}')
                    echo "RX:${rx} TX:${tx}"
                    return
                fi
                ;;
        esac
    done < /proc/net/dev
}
registrar() {
    local nivel="$1"
    local mensaje="$2"
    local ts
    ts=$(date '+%Y-%m-%d %H:%M:%S')
    printf "[%s] [%-7s] %s\n" \
        "$ts" "$nivel" "$mensaje" | tee -a "$LOGFILE"
}

resumen_log() {
    echo ""
    echo "==============================="
    echo "RESUMEN DE LA SESION"
    echo "==============================="
    local total alertas
    total=$(grep -c "\[ INFO \]" "$LOGFILE" 2>/dev/null || echo 0)
    alertas=$(grep -c "\[ ALERTA \]" "$LOGFILE" 2>/dev/null || echo 0)
    printf "%-25s %d\n" "Comprobaciones:" "$total"
    printf "%-25s %d\n" "Alertas:" "$alertas"
    echo ""
    echo "Ultimas entradas:"
    tail -3 "$LOGFILE" | while IFS= read -r linea; do
        echo "$linea"
    done
    echo "==============================="
}
historial() {
    local total=0
    local suma_disco=0
    local suma_ram=0

    while IFS= read -r linea; do
        case "$linea" in
            *"Disco:"*)
                disco=$(echo "$linea" | awk -F 'Disco: ' '{print $2}' | awk '{print $1}' | tr -d '%')
                ram=$(echo "$linea" | awk -F 'RAM: ' '{print $2}' | awk '{print $1}' | tr -d '%')

                suma_disco=$((suma_disco + disco))
                suma_ram=$((suma_ram + ram))
                total=$((total + 1))
                ;;
        esac
    done < "$LOGFILE"

    echo ""
    echo "===== HISTORIAL DE USO ====="

    if [ "$total" -eq 0 ]; then
        echo "No hay datos en el log"
        return
    fi

    prom_disco=$((suma_disco / total))
    prom_ram=$((suma_ram / total))

    printf "%-20s %10s\n" "METRICA" "PROMEDIO"
    printf "%-20s %10s\n" "Disco (%)" "$prom_disco"
    printf "%-20s %10s\n" "RAM (%)" "$prom_ram"

    echo "============================"
}
while [ $# -gt 0 ]; do
    case "$1" in
        --intervalo) INTERVALO="$2"; shift 2 ;;
        --max) MAX_ITER="$2"; shift 2 ;;
        --umbral-disco) UMBRAL_DISCO="$2"; shift 2 ;;
        --umbral-ram) UMBRAL_RAM="$2"; shift 2 ;;
        --version) echo "monitor.sh v$VERSION"; exit 0 ;;
        --help|-h) uso ;;
        --log) LOGFILE="$2"; shift 2 ;;
        --historial) historial; exit 0 ;; 
   *) echo "Opcion desconocida: $1"; uso ;;
    esac
done

trap 'echo "";
resumen_log;
registrar "INFO" "Monitor detenido.";
exit 0' INT

registrar "INFO" \
"Iniciando monitor intervalo: ${INTERVALO}s"

registrar "INFO" \
"Umbrales: disco=${UMBRAL_DISCO}% RAM=${UMBRAL_RAM}%"

iteracion=0

while true; do
    iteracion=$((iteracion + 1))

    if [ "$MAX_ITER" -gt 0 ] && [ "$iteracion" -gt "$MAX_ITER" ]; then
        registrar "INFO" \
        "Limite de $MAX_ITER iteraciones alcanzado."
        break
    fi

    disco=$(uso_disco)
    ram=$(uso_ram)
    cpu=$(carga_cpu)
    red=$(uso_red)

    registrar "INFO" \
    "Disco: ${disco}% RAM: ${ram}% CPU-load: ${cpu} RED: ${red}"

    [ "$disco" -ge "$UMBRAL_DISCO" ] && \
    registrar "ALERTA" \
    "Disco al ${disco}% (umbral: ${UMBRAL_DISCO}%)"

    [ "$ram" -ge "$UMBRAL_RAM" ] && \
    registrar "ALERTA" \
    "RAM al ${ram}% (umbral: ${UMBRAL_RAM}%)"

    sleep "$INTERVALO"
done

resumen_log

registrar "INFO" \
"Monitor finalizado tras $((iteracion - 1)) iteraciones."
