# Ejecicio 5

## Ejemplo 1: Ejecutar una aplicación web simple con Docker Compose

Creamos el archivo `docker-compose.yml` con:
```shell
sudo nano docker-compose.yml
```
E introducimos el siguiente contenido:
```YAML
version: "3.8"
services:
  web:
    image: nginx:latest
    ports:
      - "8080:80"
    volumes:
      - ./html:/usr/share/nginx/html
```
![image](https://github.com/user-attachments/assets/e58dc59d-4884-4b3a-a4f6-cbf2162ba6f8)

Creamos un directorio html con un archivo index.html con:
```shell
mkdir html
echo "<h1>Hola desde Docker Compose</h1>" > html/index.html
```
![image](https://github.com/user-attachments/assets/143a8419-152d-4fea-9c33-8d696b78d40c)

Iniciamos la aplicación con:
```shell
docker-compose up -d
```
![image](https://github.com/user-attachments/assets/26f5a7a0-ee79-4306-abd8-fe797158adfe)

