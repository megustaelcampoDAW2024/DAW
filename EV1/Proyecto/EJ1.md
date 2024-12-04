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
### Edita el archivo hosts para agregar los dominios locales
```Ubuntu
sudo nano /etc/hosts
```
Agrega las siguientes líneas:
```Ubuntu
127.0.0.1    centro.intranet
127.0.0.1    departamentos.centro.intranet
```
