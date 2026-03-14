#!/bin/bash

# sysinfo.sh - Reporte del estado del sistema
# Uso: ./sysinfo.sh [--all | --cpu | --mem | --disk | --proc]
#
# Sin argumentos muestra el reporte completo.
# Con --seccion muestra solo esa sección.

# === Constantes ===
readonly VERSION="1.0.0"
readonly SEPARADOR="=============================================="
readonly SEPARADOR_SEC="----------------------------------------------"

# === Función de ayuda ===
uso () {
echo "Uso: $0 [opcion]"
echo ""
echo "Opciones:"
echo " (sin args)   Reporte completo"
echo " --all        Reporte completo"
echo " --cpu        Solo CPU"
echo " --mem        Solo memoria"
echo " --disk       Solo disco"
echo " --proc       Solo procesos"
echo " --version    Versión del script"
echo " --help       Esta ayuda"
echo ""
echo "Ejemplos:"
echo " $0"
echo " $0 --mem"
echo " $0 --disk"
exit 2
}

# === Procesar argumentos ===
MODO="${1:---all}"

case "$MODO" in
    --all|"all") MODO="all" ;;
    --cpu) MODO="cpu" ;;
    --mem) MODO="mem" ;;
    --disk) MODO="disk" ;;
    --proc) MODO="proc" ;;
    --version)
        echo "sysinfo.sh versión $VERSION";
        exit 0
        ;;
    --help|-h)
        uso
        ;;
    *)
        echo "Error: opción desconocida '$MODO'"
        uso
        ;;
esac

echo "$SEPARADOR"
printf "REPORTE DEL SISTEMA - sysinfo.sh v%s\n" "$VERSION"
echo "$SEPARADOR"
echo ""


# === Sección 1: Información general ===
seccion_general() {
echo "[INFORMACION DEL SISTEMA]"
echo "$SEPARADOR_SEC"

printf "%-18s %s\n" "Hostname:" "$(hostname)"
printf "%-18s %s\n" "Usuario:" "$USER"
printf "%-18s %s\n" "Sistema:" "$(uname -s)"
printf "%-18s %s\n" "Kernel:" "$(uname -r)"
printf "%-18s %s\n" "Arquitectura:" "$(uname -m)"
printf "%-18s %s\n" "Fecha / Hora:" "$(date '+%d/%m/%Y %H:%M:%S')"
printf "%-18s %s\n" "Encendido:" "$(uptime -p)"

echo ""
}
# === Ejecutar según el modo ===
if [ "$MODO" = "all" ]; then
    seccion_general
fi
