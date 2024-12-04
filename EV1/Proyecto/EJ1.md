# Ejercicio 1
## 1. Instalación de Apache
### Actualizar los paquetes:
```Ubuntu
sudo apt update && sudo apt upgrade -y
```
### Instalar Apache:
```Ubuntu
sudo apt install apache2 -y
```
### Habilitar y verificar Apache:
```Ubuntu
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
```

## 2. Configuración de dominios en el archivo hosts
### Abre el archivo hosts
```Ubuntu
sudo nano /etc/hosts
```
### Añade las siguientes líneas (sustituye 192.168.1.x por la IP del servidor)
```Ubuntu
192.168.1.x centro.intranet
192.168.1.x departamentos.centro.intranet
```

## 3. Configuración de Apache para los dominios
### Habilitar los módulos necesarios
```Ubuntu
sudo a2enmod rewrite
sudo systemctl restart apache2
```
### Para centro.intranet: Crea el archivo de configuración:
```Ubuntu
sudo nano /etc/apache2/sites-available/centro.intranet.conf
```
### Contenido del archivo:
```Ubuntu
<VirtualHost *:80>
    ServerName centro.intranet
    DocumentRoot /var/www/centro
    <Directory /var/www/centro>
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/centro_error.log
    CustomLog ${APACHE_LOG_DIR}/centro_access.log combined
</VirtualHost>
```
### Para departamentos.centro.intranet: Crea el archivo de configuración:
```Ubuntu
sudo nano /etc/apache2/sites-available/departamentos.centro.intranet.conf
```
### Contenido del archivo:
```Ubuntu
<VirtualHost *:80>
    ServerName departamentos.centro.intranet
    DocumentRoot /var/www/departamentos
    <Directory /var/www/departamentos>
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog ${APACHE_LOG_DIR}/departamentos_error.log
    CustomLog ${APACHE_LOG_DIR}/departamentos_access.log combined
    ProxyPass / http://127.0.0.1:5000/
    ProxyPassReverse / http://127.0.0.1:5000/
</VirtualHost>
```
### Habilitar los VirtualHosts
```Ubuntu
sudo a2ensite centro.intranet.conf
sudo a2ensite departamentos.centro.intranet.conf
sudo systemctl reload apache2
```
### Crear las carpetas del contenido
```Ubuntu
sudo mkdir -p /var/www/centro
sudo mkdir -p /var/www/departamentos
sudo chown -R www-data:www-data /var/www/
sudo chmod -R 755 /var/www/
```

## 4. Instalación y configuración de WordPress en centro.intranet
### Instalar PHP y MySQL
```Ubuntu
sudo apt install php libapache2-mod-php php-mysql mysql-server -y
```
### Configurar la base de datos de WordPress
```Ubuntu
sudo mysql
```
### Ejevutamos:
```Ubuntu
CREATE DATABASE wordpress;
CREATE USER 'wpuser'@'localhost' IDENTIFIED BY 'tu_contraseña_segura';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wpuser'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```
### Descargar y configurar WordPress
```Ubuntu
wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
sudo mv wordpress/* /var/www/centro
sudo chown -R www-data:www-data /var/www/centro
sudo chmod -R 755 /var/www/centro
```
### Completar la instalación de WordPress: Accede en un navegador a http://centro.intranet y sigue los pasos para finalizar la configuración

## 5. Configuración de la aplicación Python en departamentos.centro.intranet
### Instalar dependencias de Python
```Ubuntu
sudo apt install python3 python3-pip -y
```
### Crear una aplicación básica en Flask
```Ubuntu
mkdir ~/departamentos_app
cd ~/departamentos_app
pip3 install flask
nano app.py
```
### Contenido de app.py:
```Python
from flask import Flask
app = Flask(__name__)

@app.route('/')
def home():
    return "Bienvenido al sitio de departamentos"

if __name__ == '__main__':
    app.run(host='127.0.0.1', port=5000)
```
### Iniciar la aplicación Python
```Ubuntu
python3 app.py
```
### Configurar un servicio de systemd para la app Python: Crea un archivo de servicio
```Ubuntu
sudo nano /etc/systemd/system/departamentos.service
```
### Contenido del archivo:
```ini
[Unit]
Description=Aplicación Flask para departamentos
After=network.target

[Service]
User=www-data
WorkingDirectory=/home/tu_usuario/departamentos_app
ExecStart=/usr/bin/python3 app.py

[Install]
WantedBy=multi-user.target
```
### Habilitar y arrancar el servicio
```Ubuntu
sudo systemctl daemon-reload
sudo systemctl enable departamentos.service
sudo systemctl start departamentos.service
sudo systemctl status departamentos.service
```
