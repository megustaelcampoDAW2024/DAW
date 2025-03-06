![image](https://github.com/user-attachments/assets/ece7587e-761c-40d6-995e-2715ebdd0da5)# Ejercicio 1 - Inslación Docker

Comenzamos actualizando con:
```shell
sudo apt-get update
```
![image](https://github.com/user-attachments/assets/7c754b95-354b-4fba-9163-dac1c411d6e9)

Arrancamos las instalación con:
```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
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
