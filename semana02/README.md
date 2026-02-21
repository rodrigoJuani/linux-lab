# Semana 02: Organizacion de Archivos y Permisos
## Objetivo
Crear un sistema automatizado que organiza archivos
desordenados
en estructura logica y aplica permisos apropiados segun
tipo .
## Archivos del Proyecto
-
-
-
-
-
‘ generate - messy - files . sh ‘ - Genera 50 archivos de prueba
‘ organize - files . sh ‘ - Organiza archivos por categoria
‘ analisis - permisos . md ‘ - Justificacion de permisos
‘ estado - inicial . txt ‘ - Estado antes de organizar
‘ estructura - final . txt ‘ - Arbol final de directorios
- ‘ permisos - aplicados . txt ‘ - Listado completo de permisos
## Uso
### 1. Generar archivos de prueba
‘‘‘ bash
./ generate - messy - files . sh
‘‘‘
Esto crea 50 archivos mezclados :
- 15 documentos (. txt , . md , . doc )
- 10 imagenes (. jpg , . png )
- 10 scripts (. sh , . py )
- 8 configuraciones (. conf , . json )
- 7 logs (. log )
### 2. Organizar archivos
‘‘‘ bash
./ organize - files . sh
‘‘‘
Crea estructura ‘ organized / ‘ con :
- documents / - Archivos de texto (644)
- images / - Imagenes (644)
- scripts / - Scripts ejecutables (755)
- config / - Configuraciones (644)
- logs / - Archivos de registro (644)
- temp / - Temporales
### 3. Verificar resultado
‘‘‘ bash
# Ver estructura
tree organized /
# Ver permisos
ls - lR organized /
# Probar script
./ organized / scripts / script_1 . sh
‘‘‘
## Comandos Aprendidos
### Manipulacion
- ‘ touch ‘ - Crear archivos
- ‘ mkdir -p ‘ - Crear directorios con padres
- ‘cp ‘ - Copiar archivos
- ‘mv ‘ - Mover / renombrar
- ‘rm ‘ - Eliminar archivos
### Permisos
- ‘ chmod 644 ‘ - Permisos numericos
- ‘ chmod u +x ‘ - Permisos simbolicos
- ‘ find ... - exec chmod ‘ - Cambiar permisos recursivos
### Busqueda
- ‘ find ‘ - Buscar por nombre , tipo , tamano
- ‘ ls -l ‘ - Ver permisos de archivos
### Wildcards
- ‘*. txt ‘ - Todos los . txt
- ‘ archivo [1 -5]. sh ‘ - Rangos
- ‘{a ,b , c } ‘ - Expansion
## Permisos Aplicados
| Tipo | Permisos | Explicacion |
| - - - - - -| - - - - - - - - - -| - - - - - - - - - - - - -|
| Documentos | 644 | Solo owner escribe |
| Imagenes | 644 | Solo owner escribe |
| Scripts | 755 | Ejecutables por todos |
| Config | 644 | Protegidas |
| Logs | 644 | Solo owner escribe |
| Directorios | 755 | Acceso para todos |
Ver ‘ analisis - permisos . md ‘ para detalles .
## Checklist
-[x]Script generador funcional
-[x]Script organizador funcional
-[x]Permisos correctos aplicados
-[x]Estructura de directorios logica
-[x]Documentacion completa
-[x]Commits incrementales (7+)
-[x]Analisis de permisos detallado

## Estructura Final
‘‘‘
organized /
documents /
(644)
documento_1 . txt
notas_1 . md
reporte_1 . doc
images /
(644)
foto_1 . jpg
screenshot_1 . png
scripts /
(755)
script_1 . sh
utilidad_1 . py
config /
(644)
config_1 . conf
settings_1 . json
logs /
(644)
sistema_1 . log
app_1 . log
temp /
‘‘‘
## Notas
- Los scripts usan ‘2 >/ dev / null || true ‘ para ignorar
errores
si algunos archivos no existen
- El organizador es idempotente : puede ejecutarse multiples
veces
- Se preserva el estado inicial para comparacion
