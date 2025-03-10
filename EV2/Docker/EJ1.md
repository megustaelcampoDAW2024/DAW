# Ejercicio 1 - Inslación Docker

Comenzamos actualizando con:
```shell
sudo apt-get update
```
![image](https://github.com/user-attachments/assets/7c754b95-354b-4fba-9163-dac1c411d6e9)

Arrancamos las instalación con:
```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

$ sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
```
![image](https://github.com/user-attachments/assets/afe59dcb-07f7-4ac3-8505-15559b964f6e)
![image](https://github.com/user-attachments/assets/161cf84a-c207-4fe4-9074-75616fe0d273)

Volvemos a actualizar los paquetes con:
```shell
sudo apt-get update
```

Y Finalizamos la instalación con
```shell
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
![image](https://github.com/user-attachments/assets/e662c16a-e113-4641-be29-3bd3ad49993f)

Comprobamos el estado del servicio
```shell
sudo systemctl status docker 
```
![image](https://github.com/user-attachments/assets/fd01e490-9e50-4650-b8d6-0b1425a9c314)
