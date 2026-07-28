Configuración de la red del Servidor Ubuntu

Fecha: 28 de Julio del 2026

Hora: 1:53 P.M.

Ahora que se tiene configurado el router correctamente, se debe configurar el servidor Ubuntu para poder levantar servicios como DHCP y SSH, para comprobar que el router ya no asigna IPs por defecto y que hay comunicación entre los diferentes dispositivos a los que se conectarán al servidor

Primeramente, es necesario conectar el equipo al router mediante conexión ethernet, identificando el cable físico ya que este se configurará en el servidor y en virtualbox

<img width="766" height="142" alt="Identificacion del cable de red" src="https://github.com/user-attachments/assets/c6229ff0-6427-4cf0-9fac-166ceb90c039" />

Cuando se haya identificado el cable de red físico, se procede a acceder a VirtualBox, en las configuraciones se busca el apartado de red y se cambia el adaptador de red a Bridged Adapter o Adaptador Puente

Aquí es importante tener en cuenta que se necesitarán 2 adaptadores, ya que uno tendrá salida hacia el servidor local y el otro será para poder descargar paquetes necesarios, por lo que se configurarán 2 adaptadores

Uno con el cable de red con salida a internet

<img width="784" height="366" alt="salida internet" src="https://github.com/user-attachments/assets/d2d1d040-ed92-4de2-be75-ba5fd273a898" />

Uno sin salida a internet

<img width="778" height="349" alt="Sin salida a internet" src="https://github.com/user-attachments/assets/fae5f5cc-75a6-444a-8dc9-fc0f658fe73f" />

Se guardan los cambios y se procede a iniciar la máquina virtual normalmente

Al escribir el comando ip a se pueden ver las IP con las que cuenta el servidor

<img width="851" height="368" alt="comando ip a" src="https://github.com/user-attachments/assets/1abf710c-1a8b-424d-bfdc-33fbadd7e4e2" />

Se puede visualizar que se tienen 2 IP en las tarjetas enp0s3 y 8, la que se debe cambiar es la enp0s8 y asignar una IP estática para con ello asegurar que el servidor no cambie de IP si se vuelve conectar al router

Ahora que se conocen las IPs del servidor, se desconecta el cable con salida a internet osea la enp0s3, basta con entrar a la opción dispositivos en Virtual Box, buscar el apartado de red desconectar o desmarcar la opción del adaptador que tenga salida a internet, en este caso es el Adapter 1

<img width="741" height="337" alt="desactivar red internet" src="https://github.com/user-attachments/assets/fd286910-243b-4985-a247-e638d04ee32a" />

Quedando solo la IP de la red enp0s8 la configuración de la IP fija será con el servicion netplan

El primer comando es ls /etc/netplan/ para verificar el nombre del archivo de configuración

Con el comando sudo nano /etc/netplan/nombre del archivo de configuración o presionando la tecla Tab se puede acceder al archivo de configuración 

<img width="574" height="167" alt="comandos iniciales" src="https://github.com/user-attachments/assets/788b4554-e22d-42e6-b5b1-a570144a65da" />

Una vez escrito el comando se accederá al archivo de configuración visualizando la red y los ethernets encontrando primeramente enp0s3, por lo que hace falta asignar las configuraciones en la red enp0s8

<img width="469" height="324" alt="enp0s8" src="https://github.com/user-attachments/assets/d0e4dcb6-0482-4732-9fb4-f6b1a9525d19" />

Como se puede observar, se escribe la nueva red enp0s8, desactivando dhcp4 y dejando ésta opción en false para que no se le asigne IP auotmáticamente

En la línea addresses se le asignará la IP que el servidor mantendrá siempre, aunque se puede modificar después y de acuerdo a las necesidades que se requiera

Se asigna un gateway y el nombre de los servidores se usaron los de Google

Finalizando escribiendo version: 2, esta última línea está termianndo las líneas de enp0s3, se puede eliminar, escribir las configuraciones de enp0s8 y reescribiendo version:2

Si las configuraciones están escritas correctamente, se utiliza el comando sudo netplan apply para aplicar los cambios en el servidor, si existieran errores de escritura mostrará una advertencia de dicho problema o error y se debe corregir

Caso contrario, se reiniciara el servicio, que al terminar al escribir ip a mostrará la IP estática que tendrá el servidor

<img width="850" height="523" alt="nueva ip 2" src="https://github.com/user-attachments/assets/45b02194-25ba-48bb-91cf-2cab7836d5fe" />

Con los cambios ya aplicados, la configuración está termiada y con ello se puede comenzar con la configuración del servicio DHCP
