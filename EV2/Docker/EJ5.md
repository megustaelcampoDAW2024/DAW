# Ejecicio 5

## Ejemplo 1: Ejecutar una aplicación web GuestBook

Creamos un directorio para la aplicación y el archivo `docker-compose.yml` con:
```shell
mkdir guestbook
sudo nano docker-compose.yml
```
E introducimos el siguiente contenido:
```YAML
version: "3.9"
services:
  redis:
    image: "redis:alpine"
    ports:
      - "6379:6379"
  web:
    build: .
    ports:
      - "8080:80"
    depends_on:
      - redis
```
![image](https://github.com/user-attachments/assets/1e401be1-50fa-4a46-8056-f5bc6ac26f3a)

Creamos el archivo `Dockerfile`
```Dockerfile
FROM python:3.8-alpine
WORKDIR /app
COPY . /app
RUN pip install redis flask
EXPOSE 80
CMD ["python", "app.py"]
```
![image](https://github.com/user-attachments/assets/237d8b10-ebe3-493e-bca7-d2a976286515)

Creamos el archivo `app.py`
```python
from flask import Flask, request, render_template
import redis

app = Flask(__name__)
r = redis.Redis(host='redis', port=6379)

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        name = request.form['name']
        message = request.form['message']
        r.rpush('messages', f"{name}: {message}")
    messages = [msg.decode('utf-8') for msg in r.lrange('messages', 0, -1)]
    return render_template('index.html', messages=messages)

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80, debug=True)
```
![image](https://github.com/user-attachments/assets/5602aae7-179c-4071-8623-a165d94537bb)

Creamos el archovo `templates\index.html`
```html
<!DOCTYPE html>
<html>
<head>
    <title>Guestbook</title>
</head>
<body>
    <h1>Guestbook</h1>
    <form method="POST">
        <input type="text" name="name" placeholder="Name"><br>
        <textarea name="message" placeholder="Message"></textarea><br>
        <button type="submit">Submit</button>
    </form>
    <h2>Messages:</h2>
    <ul>
    {% for message in messages %}
        <li>{{ message }}</li>
    {% endfor %}
    </ul>
</body>
</html>
```
![image](https://github.com/user-attachments/assets/4124ac58-c101-40b6-bcbe-c003af5848d4)

Ahora levantamos la aplicación con:
```shell
docker compose up -d
sudo docker ps
```
![image](https://github.com/user-attachments/assets/90d82978-38d6-4584-b383-d4f9a8c6785e)

Ahora simplemente comprobamos que la aplicación funciona en `localhost:8080`

![image](https://github.com/user-attachments/assets/adf0c779-f704-49a1-a533-6c658e5aabce)

<hr>

## Ejemplo 2: Ejecutar una aplicación de Temperaturas

Creamos un directorio para la aplicación y el archivo `docker-compose.yml` con:
```shell
mkdir guestbook
sudo nano docker-compose.yml
```
E introducimos el siguiente contenido:
```YAML
version: "3.9"
services:
  temperaturas:
    build: .
    ports:
      - "5000:5000"
```
![image](https://github.com/user-attachments/assets/430dc7b7-bf30-4dc9-8716-7dae9572d1fa)

Creamos el archivo `Dockerfile`
```Dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY . /app
RUN pip install flask requests
EXPOSE 5000
CMD ["python", "app.py"]
```
![image](https://github.com/user-attachments/assets/ba1d213d-b1a6-449d-9e2c-711f4f990b0a)

Creamos el archivo `app.py`
```python
from flask import Flask, jsonify
import requests

app = Flask(__name__)

@app.route('/temperature/<city>')
def get_temperature(city):
    api_key = "YOUR_API_KEY" #Necesario obtener una api key de un servicio como openweathermap
    url = f"http://api.openweathermap.org/data/2.5/weather?q={city}&appid={api_key}&units=metric"
    response = requests.get(url)
    if response.status_code == 200:
        data = response.json()
        temperature = data['main']['temp']
        return jsonify({'city': city, 'temperature': temperature})
    else:
        return jsonify({'error': 'City not found'}), 404

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
```
![image](https://github.com/user-attachments/assets/47db57d6-1a22-4a9f-9143-42e347b89a77)

Ahora levantamos la aplicación con:
```shell
docker compose up -d
sudo docker ps
```
![image](https://github.com/user-attachments/assets/044d57a0-f491-4bfb-9e8e-3388b284d1f1)

Ahora simplemente comprobamos que la aplicación funciona en `localhost:5000/temperature/Barcelona`

![image](https://github.com/user-attachments/assets/7cef6696-4065-43ab-8351-176637aa3174)

<hr>

## Ejemplo 3: Aplicación Wordpress

Creamos un directorio para la aplicación y el archivo `docker-compose.yml` con:
```yml
version: '3.9'
services:
  db:
    image: mysql:5.7
    volumes:
      - db_data:/var/lib/mysql
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: password
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: password
    expose:
      - 3306

  wordpress:
    image: wordpress:latest
    ports:
      - 80:80
    restart: always
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: password
      WORDPRESS_DB_NAME: wordpress
    depends_on:
      - db

volumes:
  db_data:
```

Explicación del archivo docker-compose.yml:

`version`: Indica la versión de la sintaxis de Docker Compose.
`services`: Define los servicios que componen la aplicación. En este caso, tenemos dos servicios: db (MySQL) y wordpress.
 - `image`: Especifica la imagen de Docker que se utilizará para el servicio.
 - `volumes`: Define los volúmenes que se montarán en el contenedor. En este caso, se monta un volumen llamado db_data para persistir los datos de la base de datos MySQL.
 - `restart`: Define la política de reinicio del contenedor. En este caso, se configura always para que el contenedor se reinicie automáticamente si falla.
 - `environment`: Define las variables de entorno que se pasarán al contenedor. En este caso, se definen variables de entorno para configurar la base de datos MySQL y WordPress.
 - `ports`: Mapea los puertos del host a los puertos del contenedor.
 - `depends_on`: Define las dependencias entre los servicios. En este caso, wordpress depende de db, lo que significa que el contenedor de WordPress se iniciará después del contenedor de la base de datos.
 - `volumes`: Define los volúmenes que se utilizarán en la aplicación.

![image](https://github.com/user-attachments/assets/cdf37574-3348-4206-8678-aab30652122b)

Esta vez no es necesario crear un Dockerfile ya que el archivo docker-compose.yml en ese ejemplo utiliza imágenes oficiales y preconstruidas de Docker Hub: `mysql:5.7` y `wordpress:latest`
Ahora levantamos la aplicación con:
```shell
docker compose up -d
sudo docker ps
```
![image](https://github.com/user-attachments/assets/4ab86129-f733-4ade-84d5-3c4e4c55f424)

Accedemos a WordPress a través de `localhost`

![image](https://github.com/user-attachments/assets/26d97f50-3a6b-4fc3-b674-54ce36544caa)
