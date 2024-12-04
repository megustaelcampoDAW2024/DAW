# Ejercicio 6: Configurar Autenticación en Apache
## 1. Crear el Archivo de Contraseñas
### 1.1 Usa el comando htpasswd para crear un archivo de contraseñas
```bash
sudo apt install apache2-utils -y
sudo htpasswd -c /etc/apache2/.htpasswd usuario
```
![Screenshot 2024-12-04 212920](https://github.com/user-attachments/assets/c223e037-04fb-496e-ac75-43ac5a56548b)
(Contraseña: usuario)

## 2. Configurar el VirtualHost para Requerir Autenticación
### 2.1 Edita el archivo del VirtualHost de departamentos.centro.intranet
```bash
sudo nano /etc/apache2/sites-available/departamentos.centro.intranet.conf
```
### 2.2 Modifica la sección <Directory> para incluir las directivas de autenticación
```bash
<Directory /var/www/departamentos.centro.intranet>
    AllowOverride All
    Require all granted

    # Configuración de autenticación
    AuthType Basic
    AuthName "Autenticación requerida"
    AuthUserFile /etc/apache2/.htpasswd
    Require valid-user
</Directory>
```
![Screenshot 2024-12-04 213202](https://github.com/user-attachments/assets/0aa5610a-853e-4ccb-9478-b2248958cba1)

### 2.3 sudo systemctl restart apache2
```bash
sudo systemctl restart apache2
```
