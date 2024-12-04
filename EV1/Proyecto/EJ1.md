# Ejercicio 1
## Instalación de Apache
### Actualizamos los paquetes:
```Ubuntu
sudo apt update && sudo apt upgrade -y
```
### Instalar Apache:
```Ubuntu
sudo apt install apache2 -y
```
### Habilitar y verificar el servicio de Apache:
```Ubuntu
sudo systemctl enable apache2
sudo systemctl start apache2
sudo systemctl status apache2
```
