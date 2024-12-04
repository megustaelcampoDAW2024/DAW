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
## 2. Configurar los Dominios Internos
### 2.1 Edita el archivo hosts para agregar los dominios locales
```Ubuntu
sudo nano /etc/hosts
```
Agrega las siguientes líneas:
```Ubuntu
127.0.0.1    centro.intranet
127.0.0.1    departamentos.centro.intranet
```
### 2.2 Configura los archivos de VirtualHost para Apache
Para centro.intranet: Crea un archivo de configuración en /etc/apache2/sites-available/centro.intranet.conf
```Ubuntu
sudo nano /etc/apache2/sites-available/centro.intranet.conf

```
Contenido del archivo:
```Ubuntu
<VirtualHost *:80>
    ServerName centro.intranet
    DocumentRoot /var/www/centro.intranet

    <Directory /var/www/centro.intranet>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```
Para departamentos.centro.intranet: Crea un archivo de configuración en /etc/apache2/sites-available/departamentos.centro.intranet.conf
```Ubuntu
sudo nano /etc/apache2/sites-available/departamentos.centro.intranet.conf
```
Contenido del archivo:
```Ubuntu
<VirtualHost *:80>
    ServerName departamentos.centro.intranet
    DocumentRoot /var/www/departamentos.centro.intranet

    <Directory /var/www/departamentos.centro.intranet>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```
### 2.3 Crea los directorios necesarios
```Ubuntu
sudo mkdir -p /var/www/centro.intranet /var/www/departamentos.centro.intranet
sudo chown -R www-data:www-data /var/www/
sudo chmod -R 755 /var/www/
```
### 2.4 Activa los sitios y reinicia Apache
```Ubuntu
sudo a2ensite centro.intranet.conf
sudo a2ensite departamentos.centro.intranet.conf
sudo systemctl reload apache2
```
