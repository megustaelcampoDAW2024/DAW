# Script 1 - Explain
### Indica que el script debe ejecutarse con bash
```Ubuntu
#!/bin/bash
```

### Verifica si se proporcionó exactamente un parámetro
```Ubuntu
if [ $# -ne 1 ]; then
```

### Busca el puerto en el archivo de configuración
```Ubuntu
grep -q "Listen $puerto" "$archivo_conf"
```

### Añade el puerto al final del archivo
```Ubuntu
echo "Listen $puerto" >> "$archivo_conf"
```

### Reinicia Apache para aplicar los cambios
```Ubuntu
systemctl restart apache2
```
