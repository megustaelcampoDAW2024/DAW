#!/bin/bash

# Verificar si se proporcionó el puerto como parámetro
if [ $# -ne 1 ]; then
  echo "Error: Sintaxis incorrecta."
  echo "Uso: $0 <puerto>"
  exit 1
fi

puerto=$1
archivo_conf="/etc/apache2/ports.conf"

# Verificar si el puerto ya existe en el archivo de configuración
if grep -q "Listen $puerto" "$archivo_conf"; then
  echo "Error: El puerto $puerto ya está en uso."
  exit 1
fi

# Añadir el puerto al archivo de configuración
echo "Listen $puerto" >> "$archivo_conf"

echo "Puerto $puerto añadido correctamente al archivo de configuración de Apache."

# Reiniciar Apache
systemctl restart apache2
