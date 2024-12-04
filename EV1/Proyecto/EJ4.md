# Ejercicio 4: Activar el Módulo WSGI
## 1. Instalar el modulo WSGI
### 1.1 Instala el paquete necesario para ejecutar aplicaciones Python con Apache
```bash
sudo apt install libapache2-mod-wsgi-py3 -y
```

### 1.2 Verifica que el módulo está instalado correctamente activándolo
```bash
sudo a2enmod wsgi
```

### 1.3 Reinicia Apache para aplicar los cambios
```bash
sudo systemctl restart apache2
```

## 2. Configurar WSGI para departamentos.centro.intranet
### 2.1 Edita el archivo de configuración del VirtualHost para este dominio
```bash
sudo nano /etc/apache2/sites-available/departamentos.centro.intranet.conf
```

### 2.2 Modifica el archivo para incluir la configuración de WSGI. Debería quedar así
```php
<VirtualHost *:80>
    ServerName departamentos.centro.intranet
    DocumentRoot /var/www/departamentos.centro.intranet

    <Directory /var/www/departamentos.centro.intranet>
        AllowOverride All
        Require all granted
    </Directory>

    # Configuración de WSGI
    WSGIScriptAlias / /var/www/departamentos.centro.intranet/app.wsgi
    <Directory /var/www/departamentos.centro.intranet>
        <Files app.wsgi>
            Require all granted
        </Files>
    </Directory>
</VirtualHost>
```

## 3. Crea un archivo WSGI para tu aplicación
```bash
sudo nano /var/www/departamentos.centro.intranet/app.wsgi
```
Contenido básico del archivo:
```python
def application(environ, start_response):
    status = '200 OK'
    output = b'Hola, esta es una aplicación Python funcionando con WSGI.'

    response_headers = [('Content-type', 'text/plain'), ('Content-Length', str(len(output)))]
    start_response(status, response_headers)

    return [output]
```
## 4. Reiniciar Apache
```bash
sudo systemctl restart apache2
```
