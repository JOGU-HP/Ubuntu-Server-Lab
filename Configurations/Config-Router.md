Configuración de router para red aislada

Fecha: 27 Julio del 2026

Hora:11:26 P.M.

Ahora que se tiene el servidor Ubuntu ya instalado, para evitar problemas con la red del hogar, se optó por configurar un router sin uso para aislar la red del servidor y de la red del hogar

Como primer paso, se reinicia el router manteniendo por 8 segundo el botón de reset, algunos modelos pueden presionarse por más tiempo, dependerá del router que se desee configurar

Una vez que el router haya sido reiniciado, se deberá acceder al panel de administración, para este caso se puede conectar al WiFi del router o conectar un cable ethernet desde la computadora donde se quiere acceder a dicho panel hacia alguno de los puertos ethernet (LAN) del router, evitando conectarlo a la salida WAN ya que puede general problemas al intentar acceder al panel de administración.

Cuando se haya conectado el equipo, se puede acceder al panel de administración, primeramente en el navegador escribiendo la dirección IP del router que viene al reverso del router físico o de manera automática se abrirá el navegador para dicha configuración

![imagen configuracion inicial del router](https://github.com/JOGU-HP/Ubuntu-Server-Lab/blob/8b3c3b5fa021cdebe30d7d196da5630315627261/Images/Config-Routerter/Configuracion%20inicial%20router.png)

En la imagen, se observa que se escriben IPs aleatorias pero que estén en el mismo rango, ya que de no ser así, se tendrá problemas para acceder al segundo panel de configuración que es de suma importancia para poder desactivar el servicio DHCP que tiene el router por defecto y que se necesita que el servidor asigne

Al guardar los cambios, automáticamente la página web cambiará a una segunda ventana que con el usuario admin y escribiendo la contraseña solicitada en la página anterior se podrá acceder al panel administrativo del router

![imagen login](https://github.com/JOGU-HP/Ubuntu-Server-Lab/blob/8b3c3b5fa021cdebe30d7d196da5630315627261/Images/Config-Routerter/login.png)


Para finalizar, se accede al apartado de router settings y en el apartado de Internet Settings se selecciona el modo AP para que no asigne IPs automáticamente sino que ahora solo sirva como punto intermedio entre el servidor y los equipos conectados que recibirán dirección IP automática.

<img width="1883" height="843" alt="Panel admin" src="https://github.com/user-attachments/assets/8a65878c-4352-4a1f-98eb-1ac171c78e38" />

<img width="1599" height="590" alt="ap" src="https://github.com/user-attachments/assets/de38dc06-4f7b-4f43-aec7-97575928080e" />

Ahora que los cambios han sido actualizados, por defecto aún seguirá asignando direcciones IP automáticamente, para comprobar conexión entre 2 laptops conectadas al router se realizará un Ping para comprobar que el router realiza de manera correcta el enlace de equipos y envío de información

<img width="579" height="218" alt="Ping fallido" src="https://github.com/user-attachments/assets/850fde73-b03b-4639-a3cf-e43a31875ac9" />


Aunque ambos equipos están conectado al mismo router, la laptop 1 no envía los paquetes y no hay respuesta

En cambio, desde la laptop 2 si se puede realizar ping hacia la laptop 1, el error se debe a que en la laptop 2 se configuró la IP manualmente, así que al cambiar para que se reciba una dirección IP automáticamente se pueda obtener una nueva IP válida y al realizar un segundo ping con la nueva dirección IP se obtiene respuesta finalmente, además de desactivar el firewall en ambas laptops para que se pueda realizar el ping exitosamente

<img width="534" height="288" alt="ping exitoso" src="https://github.com/user-attachments/assets/741c44ba-c004-49bc-aac1-9bd13a64f8cb" />

Ahora que se puede realizar ping entre estos dispositivos a través del router, por fin hay conexión entre dispositivos para poder continuar con el proyecto
