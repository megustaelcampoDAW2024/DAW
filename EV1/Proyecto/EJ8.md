# Ejercicio 8: Instalar y Configurar NGINX | Instalar y Configurar phpMyAdmin
## 1. Instalar NGINX
### 1.1 Instala NGINX
```bash
sudo apt install nginx -y
```
![Screenshot 2024-12-04 235029](https://github.com/user-attachments/assets/3e30f5ab-4434-45c5-a82b-2521c6d68281)

### 1.2 Verifica que NGINX esté instalado y en ejecución:
```bash
sudo systemctl status nginx
```
![Screenshot 2024-12-05 000332](https://github.com/user-attachments/assets/dbb6ecb8-f726-4d80-90a6-1b0a4f31ac78)
(Si nginx entra en conflicto, quizas tengas qeu desabilitar apache) 


## 2. Configurar el VirtualHost para servidor2.centro.intranet
### 2.1 Crea un archivo de configuración para el dominio
```bash
sudo nano /etc/nginx/sites-available/servidor2.centro.intranet
```
### 2.2 Añade la siguiente configuración:
```nginx
server {
    listen 8080;
    server_name servidor2.centro.intranet;

    root /var/www/servidor2.centro.intranet;
    index index.php index.html;

    location / {
        try_files $uri $uri/ =404;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }
}
```
![Screenshot 2024-12-05 000547](https://github.com/user-attachments/assets/bc0301a1-e424-47b2-b0b0-d4efc133b6e9)

### 2.3 Crea el directorio raíz para el dominio:
```bash
sudo mkdir -p /var/www/servidor2.centro.intranet
sudo chown -R www-data:www-data /var/www/servidor2.centro.intranet
sudo chmod -R 755 /var/www/servidor2.centro.intranet
```
![Screenshot 2024-12-05 000801](https://github.com/user-attachments/assets/41de293a-042a-4850-9c16-1fdd22753f98)

### 2.4 Activa el sitio y reinicia NGINX:
```bash
sudo ln -s /etc/nginx/sites-available/servidor2.centro.intranet /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```
![Screenshot 2024-12-05 000855](https://github.com/user-attachments/assets/a3c7e56b-092b-4488-9cd5-81cadcc8f8b6)

## 3. Probar Soporte para PHP
### 3.1 Crea un archivo de prueba PHP en el directorio raíz
```bash
echo "<?php phpinfo(); ?>" | sudo tee /var/www/servidor2.centro.intranet/index.php
```
![Screenshot 2024-12-05 000941](https://github.com/user-attachments/assets/37ed095f-dc48-46f7-b0cc-1cfc825a156f)

### 3.2 Edita tu archivo /etc/hosts para mapear servidor2.centro.intranet a 127.0.0.1
```bash
sudo nano /etc/hosts
```
Añade esta linea:
```bash
127.0.0.1 servidor2.centro.intranet
```
![Screenshot 2024-12-05 001044](https://github.com/user-attachments/assets/cae1b640-575f-4bad-a6c8-1a7c15da1d08)

### 3.3 Abre tu navegador y accede a http://servidor2.centro.intranet:8080. Deberías ver la página de información de PHP.
![Screenshot 2024-12-05 002417](https://github.com/user-attachments/assets/5d56c841-29c2-4ffa-a036-08b38c4d3ed0)

## 4. Instalar y Configurar phpMyAdmin
### 4.1 Instala phpMyAdmin
```bash
sudo apt install phpmyadmin -y
```
![Screenshot 2024-12-05 001157](https://github.com/user-attachments/assets/5184127f-0ced-45d1-aad9-6bd97b64c2bb)

Durante la instalación:
 - Selecciona apache2 como servidor web (aunque configuraremos NGINX).
 - Configura las opciones de la base de datos.
![Screenshot 2024-12-05 001305](https://github.com/user-attachments/assets/f12b66b8-ba4f-4fd0-929e-04760eb3fb5a)
![Screenshot 2024-12-05 001328](https://github.com/user-attachments/assets/968af7c9-a218-4e33-a737-ab3f68e30e46)

### 4.2 Crea un enlace simbólico para phpMyAdmin en el directorio de NGINX:
```bash
sudo ln -s /usr/share/phpmyadmin /var/www/servidor2.centro.intranet/phpmyadmin
```
![Screenshot 2024-12-05 001444](https://github.com/user-attachments/assets/33418c01-ec7d-49f2-8afc-ada0ae8d66d9)

### 4.3 Reinicia NGINX:
```bash
sudo systemctl reload nginx
```

### 4.4 Accede a phpMyAdmin desde tu navegador:
 - Visita http://servidor2.centro.intranet:8080/phpmyadmin.
 - Inicia sesión con las credenciales de tu base de datos.
