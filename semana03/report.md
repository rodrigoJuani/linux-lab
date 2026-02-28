# Reporte de Análisis de Logs

**Archivo analizado:** sample.log  
**Fecha del análisis:** 2026-02-28 14:09:24  
**Total de entradas:** 500

---

## 1. Top 10 Direcciones IP

| Solicitudes | Dirección IP |
|------------|--------------|
| 171 | 192.168.1.10 |
| 100 | 10.0.0.5 |
| 66 | 192.168.1.25 |
| 57 | 203.0.113.42 |
| 56 | 172.16.0.3 |
| 50 | 10.0.0.99 |

---

## 2. Distribución por Severidad

| Nivel   | Cantidad |
|---------|----------|
| FATAL | 83 |
| ERROR | 85 |
| WARNING | 69 |
| INFO | 263 |

---

## 3. Eventos por Hora

| Hora  | Eventos |
|-------|---------|
| 00:00 | 29 |
| 01:00 | 29 |
| 02:00 | 16 |
| 03:00 | 18 |
| 04:00 | 17 |
| 05:00 | 18 |
| 06:00 | 20 |
| 07:00 | 18 |
| 08:00 | 24 |
| 09:00 | 20 |
| 10:00 | 21 |
| 11:00 | 18 |
| 12:00 | 28 |
| 13:00 | 22 |
| 14:00 | 22 |
| 15:00 | 23 |
| 16:00 | 22 |
| 17:00 | 24 |
| 18:00 | 18 |
| 19:00 | 15 |
| 20:00 | 17 |
| 21:00 | 21 |
| 22:00 | 22 |
| 23:00 | 18 |

---

## 4. Top 5 Mensajes de Error

| Frecuencia | Mensaje |
|------------|----------|
| 58 | Connection timeout after 30 s |
| 46 | Authentication failed for user admin |
| 24 | Failed to write to disk |
| 21 | Out of memory error in module X |
| 19 | Database connection refused |

---

## 5. Resumen

- Sistema analizado con 500 eventos registrados.
- 168 eventos requieren atención (ERROR y FATAL).
- Análisis completado con herramientas UNIX estándar.

