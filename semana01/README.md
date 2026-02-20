# Semana 01: Fundamentos de Linux + Git Setup
## Objetivos
- Comprender estructura del filesystem
- Navegar el sistema con confianza
- Configurar Git correctamente
## Contenido
‘‘‘
semana01 /
README . md
filesystem - map . md
filesystem - diagram . txt
ejemplos - practicos . md
‘‘‘
- ‘ filesystem - map . md ‘ - Documentacion detallada de
directorios
- ‘ filesystem - diagram . txt ‘ - Diagrama visual ASCII
- ‘ ejemplos - practicos . md ‘ - Ejercicios guiados
## Comandos Aprendidos
### Navegacion
- ‘pwd ‘ - Print working directory
- ‘cd ‘ - Change directory
- ‘ls ‘ - List files
- ‘ tree ‘ - Visualizar estructura
### Ayuda
- ‘man ‘ - Manual pages
- ‘-- help ‘ - Ayuda rapida
### Git Basico
- ‘ git init ‘ - Inicializar repositorio
- ‘ git add ‘ - Agregar al staging area
- ‘ git commit ‘ - Guardar cambios
- ‘ git status ‘ - Ver estado
- ‘ git log ‘ - Ver historial
## Checklist
- [ x ] Repositorio git inicializado
- [ x ] filesystem - map . md completo (10+ directorios )
- [ x ] filesystem - diagram . txt creado
- [ x ] ejemplos - practicos . md con comandos
- [ x ] Minimo 5 commits descriptivos
- [ x ] Repositorio en GitHub
## Ejecucion
‘‘‘ bash
# Navegar por el sistema
cd /
ls - la
pwd
# Explorar con tree
tree -L 1 /
# Probar ejemplos
# Ejemplos Practicos de Navegacion
## Explorar el Sistema
‘‘‘ bash
# Ver ubicacion actual
pwd
# Ir al directorio raiz
cd /
# Listar contenido
ls -l
# Ver arbol de 2 niveles
tree -L 2 -d
# Volver a HOME
cd ~
‘‘‘
## Examinar Directorios
‘‘‘ bash
# Ver configuraciones
ls - lh / etc | head -20
# Ver logs del sistema
ls - lh / var / log
# Ver tu directorio personal
ls - la ~
# Explorar dispositivos
ls -l / dev | head
‘‘‘
## Informacion del Sistema
‘‘‘ bash
# Info del kernel
uname -a
# Distribucion
cat / etc / os - release
# CPU
cat / proc / cpuinfo | grep " model name " | head -1
# Memoria
cat / proc / meminfo | head -5
free -h
# Discos
lsblk
df -h
# Tamano de directorios raiz
du - sh /* 2 >/ dev / null
‘‘‘
## Navegacion Avanzada
‘‘‘ bash
# Ir a directorio y volver
cd / var / log
cd -
# Crear y entrar a directorio
mkdir -p ~/ proyectos / linux
cd ~/ proyectos / linux
# Ver historial de directorios
dirs -v
‘‘‘
## Buscar Archivos
‘‘‘ bash
# Buscar archivo por nombre
find / etc - name " hosts " 2 >/ dev / null
# Buscar archivos . conf
find / etc - name "*. conf " - type f 2 >/ dev / null | head
# Archivos grandes en home
find ~ - type f - size +10 M 2 >/ dev / null
‘‘‘
## Recursos
- Man pages : ‘ man ls ‘ , ‘ man bash ‘
- FHS ( Filesystem Hierarchy Standard )
- GitHub : https :// github . com /rodrigoJuani/ linux - lab
