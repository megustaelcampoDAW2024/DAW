# Ejercicio 8: Instalar y Configurar NGINX | Instalar y Configurar phpMyAdmin
## 1. Instalar NGINX
### 1.1 Instala NGINX
```bash
sudo apt install nginx -y
```

### 1.2 Verifica que NGINX esté instalado y en ejecución:
```bash
sudo systemctl status nginx
```

### 1.3 Accede al servidor web desde tu navegador desde http://localhost

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

### 2.3 Crea el directorio raíz para el dominio:
```bash
sudo mkdir -p /var/www/servidor2.centro.intranet
sudo chown -R www-data:www-data /var/www/servidor2.centro.intranet
sudo chmod -R 755 /var/www/servidor2.centro.intranet
```

### 2.4 Activa el sitio y reinicia NGINX:
```bash
sudo ln -s /etc/nginx/sites-available/servidor2.centro.intranet /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
```

## 3. Probar Soporte para PHP
### 3.1 Crea un archivo de prueba PHP en el directorio raíz
```bash
echo "<?php phpinfo(); ?>" | sudo tee /var/www/servidor2.centro.intranet/index.php
```

### 3.2 Edita tu archivo /etc/hosts para mapear servidor2.centro.intranet a 127.0.0.1
```bash
sudo nano /etc/hosts
```
Añade esta linea:
```bash
127.0.0.1 servidor2.centro.intranet
```

### 3.3 Abre tu navegador y accede a http://servidor2.centro.intranet:8080. Deberías ver la página de información de PHP.

## 4. Instalar y Configurar phpMyAdmin
### 4.1 Instala phpMyAdmin
```bash
sudo apt install phpmyadmin -y
```
Durante la instalación:
 - Selecciona apache2 como servidor web (aunque configuraremos NGINX).
 - Configura las opciones de la base de datos.

### 4.2 Crea un enlace simbólico para phpMyAdmin en el directorio de NGINX:
```bash
sudo ln -s /usr/share/phpmyadmin /var/www/servidor2.centro.intranet/phpmyadmin
```

### 4.3 Reinicia NGINX:
```bash
sudo systemctl reload nginx
```

### 4.4 Accede a phpMyAdmin desde tu navegador:
 - Visita http://servidor2.centro.intranet:8080/phpmyadmin.
 - Inicia sesión con las credenciales de tu base de datos.
