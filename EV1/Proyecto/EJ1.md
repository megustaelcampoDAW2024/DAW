# Ejercicio 1
## 1. Instalación de Apache
### Actualizar los paquetes:
```bash
sudo apt update && sudo apt upgrade -y
```
![Link Foto](https://github.com/user-attachments/assets/a17a17ea-796f-4ad9-bd7c-a7852e4d910b)

### Instalar Apache:
```bash
sudo apt install apache2 -y
```
![Screenshot 2024-12-04 170956](https://github.com/user-attachments/assets/42fe139c-feed-4213-891a-c4811621cd37)

### Habilitar y verificar Apache:
```bash
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
```

## 2. Configurar los Dominios Internos
### 2.1 Edita el archivo hosts para agregar los dominios locales
```bash
sudo nano /etc/hosts
```

Agrega las siguientes líneas:
```bash
127.0.0.1    centro.intranet
127.0.0.1    departamentos.centro.intranet
```

### 2.2 Configura los archivos de VirtualHost para Apache
Para centro.intranet: Crea un archivo de configuración en /etc/apache2/sites-available/centro.intranet.conf
```bash
sudo nano /etc/apache2/sites-available/centro.intranet.conf

```

Contenido del archivo:
```less
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
```bash
sudo nano /etc/apache2/sites-available/departamentos.centro.intranet.conf
```

Contenido del archivo:
```less
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
```bash
sudo mkdir -p /var/www/centro.intranet /var/www/departamentos.centro.intranet
sudo chown -R www-data:www-data /var/www/
sudo chmod -R 755 /var/www/
```

### 2.4 Activa los sitios y reinicia Apache
```bash
sudo a2ensite centro.intranet.conf
sudo a2ensite departamentos.centro.intranet.conf
sudo systemctl reload apache2
```
