---

# Semana 08: Arrays y Matrices en Bash

## Objetivo

Analizar el repositorio `linux-lab` usando arrays indexados,
arrays asociativos y matrices simuladas para generar un
inventario completo de su contenido.

---

##  Archivos

| Archivo              | Descripción                          |
| -------------------- | ------------------------------------ |
| inventario.sh        | Script principal de análisis         |
| inventario-report.md | Reporte generado (no versionado)     |
| commands-used.md     | Documentación de comandos y técnicas |

> inventario-report.md no se versiona (.gitignore)

---

## Uso

### Analizar el repositorio actual

```bash
./inventario.sh
```

### Analizar otro directorio

```bash
./inventario.sh /ruta/al/repo
```

---

## Técnicas Aplicadas

* `mapfile -t` para cargar `find` en un array
* Arrays asociativos para conteo y tamaño por extensión
* Matriz 1D simulando tabla 2D por semana
* `column -t` para salida tabular alineada
* `printf` para formato de columnas fijas
* Reporte en Markdown generado automáticamente

---

## Checklist

* [x] Carga de archivos con `mapfile`
* [x] Conteo por extensión con array asociativo
* [x] Cálculo de tamaño total por extensión
* [x] Detección de README por semana
* [x] Matriz de resumen (scripts, docs, size)
* [x] Salida formateada con `column` y `printf`
* [x] Reporte Markdown generado
* [x] Desarrollo incremental con 8+ commits

---
