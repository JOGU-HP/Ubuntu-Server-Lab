Levantando servicio DHCP

Dia:1 de Julio del 2026

Hora: 2:30 P.M.

El servicio DHCP es el servicio en que una red y un servidor proporcionan direcciones IP automáticamente

Si bien, se le puede colocar una IP estática a los dispositivos que se conecten a la red no tendría sentido levantar un servicio DHCP si no se va a utilizar

Una consideración a tener en cuenta es que el router que estaba destinado a utilizarse como puente para el tráfico de la red ocasionó problemas con dicho servicio DHCP, problemas que serán documentados y resueltos pero que se ha optado por cambiar de hardware para evitar problemas con la red y buscar soluciones más óptimas

Una vez iniciada la máquina virtual con Ubuntu Server, con el comando ip a se pueden ver las redes que se han configurado con anterioridad enp0s3 y enp0s8

La red que nos importa es la enp0s3 que se ha configurado con una IP estática, dicha IP no puede modificarse a menos que se requiera, por lo que la máquina virtual o bien, el servidor donde se le coloque la IP estática no puede tenerla otro dispositivo que no sea ese servidor o host

Dicho éso, se descarga el paquete DHCP, dicho paquete contiene el servicio DHCP, si es que se ha desactivado la red enp0s8 se puede iniciar para que se tenga acceso a internet y poder descargar los paquetes necesarios

El comando de instalación es sudo apt install isc-dcph-server

<img width="667" height="207" alt="descarga dhcp" src="https://github.com/user-attachments/assets/fe7de0f6-def0-4112-b290-c4a4c5e538e7" />

Cuando el servicio DHCP haya sido descargado exitosamente realizará el programado de parámetros para la conexión

Antes de continuar, se debe especificar que interfaz será la responsable de proporcionar el servicio

Para este paso, se accede al archivo nano /etc/default/isc-dhcp-server que abrirá un archivo editable y con ello mostrará las interfaces para proporcionar las interfaces como IPv4 que es la que importa

El archivo contiene líneas de código con lasd interfaces IPv4 e IPv6 frente a la INTERFACESv4 y entre comillas se escribe el nombre de la tarjeta que será la responsable de proporcionar dicho servicio DHCP, en este caso será enp0s3 como en la siguiente imagen

<img width="671" height="329" alt="Screenshot 2026-08-01 144352" src="https://github.com/user-attachments/assets/017e61e3-8245-49f4-a160-5019253ceca3" />

Los cambios para guardar en archivos nano son la combinación de las teclas

Ctrl + O

Presionar Enter si se quieren guardar los cambios

Ctrl + X para cerrar el editor

Cuando los cambios sean guardados se utilizará el comando sudo nano /etc/dhcp/dhcpd.conf

<img width="777" height="808" alt="Screenshot 2026-08-01 144615" src="https://github.com/user-attachments/assets/62af3d3c-0218-4c9f-b17b-f1032f6cd43b" />

Dentro de este archivo, ubicándose en las últimas líneas de código se procede a escribir el siguiente script, básico pero funcional que se puede adaptar según las necesidades del entorno donde será implementado

<img width="391" height="167" alt="Screenshot 2026-08-01 144823" src="https://github.com/user-attachments/assets/7b75af4f-3ff2-4831-98fa-8c68ed048e6f" />

Este script asigna a un grupo la red

La red se llama 192.168.3.0 con la máscara de red 255.255.255.0

En la línea range se asigna desde que número de IP se comenzarán a asignar las IPs a los dispositivos que se conecten al servidor, en este caso comenzando desde la IP con .20 como último octeto hasta la .50 con un total de 30 dispositivos conectados a la red

Option routers es la puerta de enlace en la red que será la primer IP en una red es decir el último octeto .1

Se pueden especificar los dominios que se utilizarán en la red, en este caso se usaron los dominios de Google

De igual forma, se guardan los cambios con las combinaciones de teclas ya especificadas

Para comprobar que no ha exitido algun error en la configuración del script y que no se tienen errores de sintáxis se emplea el comando sudo nano dhcpd -t -cf /etc/dhcp/dhcpd.conf

En caso de que existan errores de escritura este comando mostrará dichos errores, si no existieran estos errores el comando no mostrará error

<img width="483" height="145" alt="Screenshot 2026-08-01 150949" src="https://github.com/user-attachments/assets/b47aca29-502d-4f9b-a980-06c14e209169" />

Ahora que el comando funciona, se puede corroborar el estatus del servicio con el comando sudo systemctl status isc-dhcp-server

<img width="986" height="385" alt="Screenshot 2026-08-01 151135" src="https://github.com/user-attachments/assets/374cf4b0-ecad-40f5-a670-ee4b9d037618" />

Si el servicio esta desactivado se escribirá el comando sudo systemctl restart isc-dhcp-server para iniciar el servicio, al emplear de nuevo el comando del estatus deberá mostrar active

Ahora que se ha configurado el servicio DHCP en teoría cualquier dispositivo conectado al servidor mediante un cable ethernet ya sea un router o switch automáticamente obtendrá una IP dentro del rango ya establecido

Para ello se necesitarán de 3 dispositivos para verificar dicha suposición

Windows 11 (Máquina Física)
Windows 11 (2da máquina física)
Debian 13 (Máquina Virtual)

Las conexiones serán mediante un switch básico de 5 puertos, en el primero estará conectada la máquina con Windows 11 y Ubuntu Server

La segunda conexión será mediante un cable ethernet al 2do puerto del switch y estará conectada a la 2da máquina física y con Debian 13 en máquina virtual

Máquina Física Windows 11

<img width="666" height="436" alt="Screenshot 2026-08-01 151815" src="https://github.com/user-attachments/assets/9a30718c-16e1-4b3f-ba6e-e8d57136f8b6" />

En la primer máquina física se observa que el servidor ya ha proporcionado la dirección IP y es dentro del rango especificado

2da máquina física Windows 11

<img width="881" height="420" alt="WhatsApp Image 2026-08-01 at 3 23 18 PM" src="https://github.com/user-attachments/assets/7bc8eaf7-ca6e-4483-b885-41fdee3090b2" />

Máquina Virtual Debian 13

<img width="938" height="156" alt="WhatsApp Image 2026-08-01 at 3 25 28 PM" src="https://github.com/user-attachments/assets/0aa57673-2177-4819-8f99-170e8e1a9680" />

Al observar que efectivamente el servicio DHCP está funcionando correctamente y ya asigna direcciones IP automáticamente la implementación del servicio DHCP ha sido completado exitosamente

Problemas implementación servicio DHCP

Uno de los principales problemas fué con el router que estaba destinado a utilizarse como medio para poder enviar el tráfico e información mediante sus puertos LAN, ocasionaba problemas ya que el router aún asignaba direcciones DHCP, aún cuando el router estaba en modo de AP, para ello se optó por utilizar y que es la opción más recomendable un switch básico de 5 puertos, ya que un switch no asigna direcciones IP sino que se encarga solamente del enlace de dispositivos localmente, esta desición fué la mejor ya que no se tuvieron problemas al momento de conectar los dispositivos mediante sus puertos

Además, en la 2da máquina física con Windows 11 obtenía DHCP del router y del servidor, haciendo que por cortos periodos de tiempo obtenía dirección IP del router y a veces del servidor, por ello mismo se tomó la desición de usar y adquirir un switch, básico pero funcional para este laboratorio.
