#!/bin/bash

# Solicitar información al usuario
read -p "Introduce el título de la página: " titulo
read -p "Introduce la cabecera: " cabecera
read -p "Introduce el mensaje: " mensaje

# Crear el contenido de la página web
cat << EOF > index.html
<!DOCTYPE html>
<html>
<head>
  <title>$titulo</title>
</head>
<body>
  <h1>$cabecera</h1>
  <p>$mensaje</p>
</body>
</html>
EOF

echo "Página web creada con éxito: index.html"
