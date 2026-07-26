Configuración Ubuntu Server Usuario Principal

Fecha: 25 de Julio del 2026

Hora: 3:02 P.M.

El día de hoy después de la instalación de Ubuntu Server en una máquina virtual, configurando recursos con 25 GB de almacenamiento interno y 4 GB de memoria RAM, se realizó el primer acceso al servidor, identificando problemas desde la configuración de virtual box, dejando vboxuser por defecto y con la contraseña que se otorgaba por defecto en la configuración inicial del servidor desde virtual box, por lo que la primer configuración que se realizó fué el cambio del usuario principal

Pero antes de realizar el cambio, se actualizó el sistema, con los comandos sudo apt update y sudo apt upgrade

Cuando el sistema ha sido actualizado con éxito, se procede a cambiar el nombre del ususario vboxuser por el usuario admin

Primero se crea un nuevo usuario temporal, llamado tempuser, asignandole permisos de super usuario

![Creacion del usuario](https://github.com/JOGU-HP/Ubuntu-Server-Lab/blob/8fc95ea5b0d716ce42d80e8f2ca3085391adf421/Images/crear%20tempuser.png)

Se cierra la sesión actual y se accede con las credenciales del usuario temporal

Como el usuario temporal está en el grupo sudo, puede realizar cambios a otros usuarios, por lo que se procede a utilizar el comando sudo usermod -l nuevo_nombre_usuario antiguo_nomnbre_usuario

Si al escribir el comando no muestra error ni algún mensaje significa que los cambios fueron aplicados correctamente

Como el usuario contiene su carpeta con el nombre vboxuser se debe cambiar el nombre del directorio con el comando

sudo usermod -d /home/nombre_nuevo_usuario -m nombre_nuevo_ususario

![Cambio nombre](https://github.com/JOGU-HP/Ubuntu-Server-Lab/blob/8fc95ea5b0d716ce42d80e8f2ca3085391adf421/Images/cambio%20de%20carpetas.png)

Una vez realizados los cambios correspondientes, se cierra la sesión del usuario temporal con el comando exit

Al acceder nuevamente al servidor solicitará el nombre del usuario con el que queremos acceder y la contraseña, por lo que se escribe el nombre del usuario Admin y su respectiva contraseña y con el comando cd /home/ seguido del comando pwd se puede visualizar que el nombre de la carpeta del usuario ha sido cambiado por el nombre que se la colocado con anterioridad

![Verifiacion de cambios](https://github.com/JOGU-HP/Ubuntu-Server-Lab/blob/8fc95ea5b0d716ce42d80e8f2ca3085391adf421/Images/neuvos%20cambios.png)

Tener un usuario temporal puede no ser eficiente y no ser seguro, así que con el comando sudo deluser usuario se eliminará el usuario especificado

Si se accede al directorio /home/ y se listan los directorios que contiene se pueden observar los directorios del usuario administrador y del usuario temporal, es de importancia eliminarlos para que no exitan confusiones con los próximos directorios a crear

Con el comando sudo rm -rf usuario se eliminará el directorio del usuario y al listar nuevamente el directorio deberá de desaparecer dando como resultado que el usuario se ha cambiado con éxito y que el usuario temporal ha sido eliminado correctamente.

![Elimincacion de directorio](https://github.com/JOGU-HP/Ubuntu-Server-Lab/blob/8fc95ea5b0d716ce42d80e8f2ca3085391adf421/Images/eliminacion%20de%20directorio%20usuario%20temporal.png)

Aprendizaje Obtenido

Al encontrarme con el problema del usuario con un nombre erróneo o mal nombrado, me obligó a buscar soluciones para renombrar a dicho usuario, creando un usuario temporal y asignando permisos de super usuario, lo que reforzó y refrescó comandos que se utilizaron con anterioridad, además de impplementar comandos básicos para el reconocimiento del sistema como los comandos ls, pwd, whomami y cd
También implementando comandos como cat /etc/passwd para poder visualizar los usuarios existentes y comprobar la existencia del usuario temporal y del usuario administrador.
