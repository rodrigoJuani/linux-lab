---

#  Semana 08: Comandos y Técnicas Usadas

## 🔹 mapfile

```bash
mapfile -t archivos < <(find "$REPO" -type f | sort)
```

**Para qué sirve:** carga cada línea de la salida de `find` en un
elemento del array `archivos`. La opción `-t` elimina el newline
de cada elemento.

---

## 🔹 Arrays asociativos

```bash
declare -A conteo
conteo["$ext"]=$((${conteo["$ext"]:-0} + 1))
```

**Para qué sirve:** acumula el conteo de archivos por extensión.
El patrón `:-0` inicializa la clave a 0 si no existía.

---

## 🔹 Matriz con array indexado

```bash
matriz[$((i * COLS + col))]="$valor"
```

**Para qué sirve:** simula una tabla bidimensional usando un
array lineal. El índice se calcula como `fila * columnas + columna`.

---

## 🔹 column

```bash
{ echo "ENCABEZADO1 ENCABEZADO2"; datos; } | column -t
```

**Para qué sirve:** alinea automáticamente las columnas del texto
sin calcular anchos manualmente.

---

## 🔹 paste

```bash
paste -sd ',' lista.txt
```

**Para qué sirve:** convierte una columna en una sola línea
separada por comas.

---
