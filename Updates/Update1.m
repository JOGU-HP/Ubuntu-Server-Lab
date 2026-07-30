Actualización 1 Proyecto Propio
El día de hoy, se descargo y configuró el servidor, utilizando el sistema operativo en una máquina virtual con Ubuntu Server, debido a la simplicidad que ofrece ese S.O.
Se configuraron parámetros como memoria RAM, almacenamiento que ocupará en la máquina física y demás
El primer problema resuelto, fue el nombramiento del usuario administrador en el servidor, por defecto el usuario era vboxuser, después de ciertos pasos en el md de Instalación se muestra paso a paso como se renombró el usuario para colocar el nombre Admin

Actualización 2
La segunda actualización del proyecto será implementar un router como administrador de la red, al ser una red aislada, el router solo debe funcionar como intermediario y ampliar las conexiones con sus puertos LAN, por ello mismo se reconfiguró el router para que funcionara como AP y con ello funcionar para pasar el tráfico y datos entre dispositivos conectados en el router.

Actualización 3
La tercer actualización fué la configuración de la IP estática del servidor, cambiando el archivo yaml, en el md Red-Server se demuestra como se configura esta IP estática, su principal función será utilizarla como identificador único del servidor, más adelante será necesario ya que este servidor configurará en su red proporcionar servidio DHCP para que todos los dispositivos conectados al servidor mediante cableado físico (ethernet) se les proporcione una dirección IP dentro del rango establecido con el srvidor

Actualización 4
Después de realizar pruebas configurando el servicio DHCP, surgen problemas como que el router, desactivando el servicio DHCP continua proporcionando una dirección IP diferente a la que el servidor Ubuntu fué configurado, descartando el uso del router para implementar un switch real y con ello evitar que la red se deconecte seguido, una actualización que no estaba prevista pero que ayudará al desarrollo de este proyecto, y que será documentado proximamente.
