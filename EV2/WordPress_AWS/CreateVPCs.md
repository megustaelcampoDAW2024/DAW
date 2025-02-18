# Creación de Subredes VPC
### Aquí veremos cómo crearemos la infraestructura de la subredes públicas y privadas
### **1. ¿Cómo crear una VPC?**
- **Paso 1:** Accedemos a el `Laboratorio` > `VPC` > `Create VPC`

![image](https://github.com/user-attachments/assets/c4a35485-d3cc-414e-873b-11abda279eee)

- **Paso 2:** Copletamos la información del formulario
  
  - **Generación automática de etiquetas de nombre:** Marcamos la generación automática y agrego el nombre: `pject-wordpress`
  - **Bloque de CIDR IPv4:** `10.2.0.0/16`
  - **Bloque de CIDR IPv6:** `No IPv6 Block`
  - **Tenencia:** `Predeterminado`
  - **Personalizar las zonas de disponibilidad:**
    - **Primera zona de disponibilidad:** `us-east-1a`
    - **Segunda zona de disponibilidad:** `us-east-1b`
  - **Cantidad de subredes públicas:** `2`
  - **Cantidada de subredes privadas:** `2`
  - **Personalizar bloques de CIDR de subredes:**
    - **Bloque de CIDR de la subred pública en us-east-1a:** `10.2.0.0/24`
    - **Bloque de CIDR de la subred pública en us-east-1b:** `10.2.1.0/24`
    - **Bloque de CIDR de la subred privada en us-east-1a:** `10.2.2.0/24`
    - **Bloque de CIDR de la subred privada en us-east-1b:** `10.2.3.0/24`
  - **Gateways NAT ($):** `Ninguna`
  - **Puntos de enlace de la VPC:** `Ninguna`
  - **Opciones de DNS:**
    - **Habilitar nombres de host DNS:** `Habilitada`
    - **Habilitar la resolución de DNS:** `Habilitada`

![image](https://github.com/user-attachments/assets/b779c96c-47f9-44c9-acf2-b97b43816688)
![image](https://github.com/user-attachments/assets/3b17c200-8ef8-4f67-921b-7935a7a5a6ac)

- **Paso 3:** Clicamos en el botón `Crear VPC`

![image](https://github.com/user-attachments/assets/f6ce0734-728e-4880-91f8-d4b1d396086e)

Una vez se cree el flujo de trabajo, clicamos `Ver VPC`. Aquí podremos ver la información un mapa conceptual de las subredes privadas:

![image](https://github.com/user-attachments/assets/13051d4a-4951-4d19-9aa1-6704bcbe92a4)
