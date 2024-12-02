# Script 1 - Explain
```Ubuntu
#!/bin/bash
```
### Indica que el script debe ejecutarse con bash

```Ubuntu
if [ $# -ne 1 ]; then
```
### Verifica si se proporcionó exactamente un parámetro

```Ubuntu
grep -q "Listen $puerto" "$archivo_conf"
```
### Busca el puerto en el archivo de configuración

```Ubuntu
echo "Listen $puerto" >> "$archivo_conf"
```
### Añade el puerto al final del archivo

```Ubuntu
systemctl restart apache2
```
### Reinicia Apache para aplicar los cambios
