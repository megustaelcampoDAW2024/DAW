# Ejercicio 6

## Ejemplo 1

Creamos un dorectorio y un archivo `index.html` dentro de el
```html
<!DOCTYPE html>
<html>
<head>
    <title>Mi Sitio Estático</title>
</head>
<body>
    <h1>¡Hola desde Docker!</h1>
</body>
</html>
```
![image](https://github.com/user-attachments/assets/b55adf98-de41-4216-a64b-21532299f5ca)

Creamos un archivo `Dockerfile`
```Dockerfile
FROM nginx:alpine
COPY index.html /usr/share/nginx/html
```
 - `FROM nginx:alpine`: Utilizamos la imagen base de Nginx en su versión Alpine, que es muy ligera.
 - `COPY index.html /usr/share/nginx/html`: Copiamos nuestro archivo `index.html` al directorio donde Nginx sirve los archivos estáticos.

![image](https://github.com/user-attachments/assets/bd72b983-3fac-4dc9-99cc-6d1b479ad147)

Construimos la imagen con:
```shell
docker build -t mi-sitio-estatico:v1 .
```
Explicación:
 - `docker build`: Comando para construir una imagen.
 - `-t mi-sitio-estatico:v1`: Etiquetamos la imagen como `mi-sitio-estatico` con la versión `v1`.
 - ` . `: Especificamos que el contexto de construcción es el directorio actual.

![image](https://github.com/user-attachments/assets/e7275f3c-8475-470d-8f62-e3ed42c12786)

Ejecutamos el contenedor con:
```shell
docker run -d -p 8080:80 mi-sitio-estatico:v1
```
Explicación:
 - `docker run`: Comando para ejecutar un contenedor.
 - `-d`: Ejecutamos el contenedor en segundo plano (detached mode).
 - `-p 8080:80`: Mapeamos el puerto 8080 de nuestra máquina al puerto 80 del contenedor.

![image](https://github.com/user-attachments/assets/4ad44b4f-0043-4467-9c67-f98f08057bb6)

Verificamos accediendo a `http://localhost:8080`

![image](https://github.com/user-attachments/assets/74b58377-0740-4c93-9247-3fb254e48dd7)

<hr>

## Ejemplo 2: Construcción de una imagen con una aplicación PHP

Creamos un directorio y dentro creamos un `index.php`
```php
<?php
echo "¡Hola desde PHP en Docker!";
?>
```
![image](https://github.com/user-attachments/assets/780b365f-3bf9-44f4-ad14-6a2e60e01ccf)

Creamos un archivo `Dockerfile`
```shell
FROM php:7.4-apache
COPY index.php /var/www/html/
```
Explicación:
 - `FROM php:7.4-apache`: Utilizamos la imagen base de PHP 7.4 con Apache.
 - `COPY index.php /var/www/html/`: Copiamos nuestro archivo index.php al directorio raíz del servidor web.

![image](https://github.com/user-attachments/assets/44baed58-d54e-406c-9e5d-8363e00b00e7)

Construimos la imagen con:
```shell
docker build -t mi-aplicacion-php:v1 .
```
![image](https://github.com/user-attachments/assets/8b39ae19-b6da-474a-b8f8-38a9587862eb)

Ejecutamos el contenedor con:
```shell
docker run -d -p 8081:80 mi-aplicacion-php:v1
```
![image](https://github.com/user-attachments/assets/963caf21-6e5e-4e01-aff2-2bc9d2c6738d)

Verificamos en `http://localhost:8081`
![image](https://github.com/user-attachments/assets/83f2861e-f176-41f1-b5ed-03d8da7385f8)

<hr>

## Ejemplo 3: Construcción de una imagen con una aplicación Python

Creamos un directorio y dentro creamos un archivo `app.py` y un archivo adiccional `requirements.txt`
```python
# app.py
from flask import Flask
app = Flask(__name__)

@app.route('/')
def hello():
    return '¡Hola desde Python en Docker!'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

`requirements.txt`
```txt
Flask
```
![image](https://github.com/user-attachments/assets/20fc6493-0cac-4588-a982-38a4bbfe5851)

Ahora creamos un archivo `Dockerfile`
```Dockerfile
FROM python:3.8-slim-buster
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
CMD ["python", "app.py"]
```
![image](https://github.com/user-attachments/assets/4e52ebf6-dfe6-4551-9700-c346eb3c4f68)

Construimos la imagen con:
```shell
docker build -t mi-aplicacion-python:v1 .
```
![image](https://github.com/user-attachments/assets/d3cb011e-dd1b-4dec-982a-d559db1f4d54)

Ejecutamos el contenedor con:
```shell
docker run -d -p 5000:5000 mi-aplicacion-python:v1
```
![image](https://github.com/user-attachments/assets/fe57f6ce-f761-438a-bc78-e41190c842dd)

Para verificar accedemos a `http://localhost:5000`

![image](https://github.com/user-attachments/assets/0eaea64d-8bec-42c0-81fd-17a27e96eb64)
