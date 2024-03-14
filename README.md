<div align="center">
    <h1>Born2beRoot</h1>
    <img src="https://github.com/yowcloud/yowcloud-my-utils/blob/main/badge_ft_printf_113px.png">
</div>

# [SUBJECT](https://github.com/yowcloud/Born2beRoot/blob/main/born2beroot_es.subject.pdf)

# Introducción

Una máquina virtual es un software que simula un ordenador dentro de otro ordenador. Permite ejecutar diferentes sistemas operativos y aplicaciones en un entorno virtualizado, separado del sistema operativo principal.

La elección de SO es Debian, podríamos querer usar una máquina virtual para propósitos de desarrollo, pruebas o incluso para ejecutar programas que requieren un entorno específico. Por ejemplo, podríamos usar una máquina virtual de Debian para probar nuevas configuraciones de software sin afectar al sistema principal, o para ejecutar aplicaciones que no son compatibles directamente con el sistema operativo principal.

Debemos descargar la ISO de la última versión de [Debian S.O.](https://www.debian.org/) 

1. Seleccionar Debian 10.X 64-bits
2. Elegir el tipo de  Boot Firmware Type
    1. Legacy BIOS
        
        No crea ninguna partición específica y entra en los requerimientos del subject.
        
    2. UEFI
        
        Crea una partición nueva e incumpliría con el subject.
        
3. En el botón de 'Customize Settings'
    1. Ingresamos el nombre de la Máquina Virtual (MV): 'Born2beRoot'
    2. Elegimos 'sgoinfre' como la ruta donde se almacenará la MV.
        
        Optamos por esta ruta para evitar que ocupe espacio en nuestro usuario. 'Goinfre' es una carpeta compartida que ofrece espacio de almacenamiento adicional para los usuarios en ciertos entornos, como la Escuela 42.
        
        Es esencial crear un directorio con tu nombre de usuario y los permisos necesarios.
        
        Debes usar el comando cd .. hasta encontrar sgoinfre
        
        `→ sgoinfre$ mkdir “tu_user”`
        
        - `>goinfre$ chmod 700 “tu_user”`
        
        Esto asignará permisos de lectura, escritura y ejecución solo para ti como propietario, y ningún permiso para otros usuarios.
        
        Si quieres completar la primera parte del bono, debes ampliar el espacio predeterminado que proporciona VMware a 30GB. Puedes hacer esto ajustando la configuración de la aplicación antes de iniciarla.
        
    
    ![Screen Shot 2024-03-06 at 11.53.00 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.53.00_AM.png)
    
4. Elige el idioma inglés, el teclado y luego donde estás.
5. Hostname:
    1. Debe ser tu login mas 42. `gusgonza42`
    2. Deja el dominio vacío.
    3. Establece una contraseña. Para visualizarla, usa la tecla de tabulación y luego el espacio. Hello42bcn-
    4. Selecciona el nombre de nuestro nuevo usuario. Como indica el subject, debemos crear un usuario adicional que no sea root con nuestro login. `gusgonza` contraseña `Hello42Spain.`
    
    En este punto si quieres hacer un parte del bonus tendrías que escoger la opción manual y seguir los pasos del apartado de bonus del este documento. es fácil de hacerlo. Si no, sigue con los pasos.
    
6. Escogeremos la tercera opción `Guied - use entire disk and set up encrypted LVM`, ya que el subject indica que deben ser particiones cifradas.
7. Una vez seleccionado el disco, debemos hacer el particionado como se nos pide. Para hacerlo correctamente, seleccionamos la segunda opción `Separate /home partition` y le damos a YES.
Cancelamos, ya que el borrado de datos en el disco no es necesario.
8. De nuevo, debemos establecer una contraseña. Esta vez será la frase de encriptación. Como mencioné antes, debes repetir el proceso y anotar la contraseña, ya que será importante en el futuro. `Yowcloud42`
9. En este paso, introducimos la cantidad de volumen que usaremos para la partición guiada. Deberíamos introducir `max` o el número máximo de tamaño disponible, que en mi caso es `20.9 GB`.
10. Para finalizar la partición y escribir los cambios en el disco, seleccionamos la opción `Finish partitioning and write changes to disk` y confirmamos con YES.
    1. Seleccionamos la opción `No`, ya que no necesitamos paquetes adicionales instalación media 
    2. ¿Qué son los volúmenes lógicos?
        
        Los volúmenes lógicos son como carpetas virtuales donde puedes agrupar tus archivos desde diferentes lugares, haciendo que sea más fácil administrarlos y moverlos según sea necesario.
        
11. Seleccionamos la opción `Yes` para continuar y confirmar que no queremos hacer más cambios en el disco. Hará la instalación base del sistema.
12. Escogemos nuestro país.
13. Escogemos `deb.debian.org`, ya que es lo que recomienda Debian.
14. La opción de Configure el HTTP proxy information la dejaremos vacía y le daremos `Continue`.  Esta configurando e instalando.
15. Seleccionamos la opción `No` porque no deseamos que los desarrolladores vean nuestras estadísticas, incluso si son anónimas.
16. Quitaremos todas las opciones de software (con la barra espaciadora) y le daremos a `Continue`. Esperamos mientras instala
17. Seleccionaremos `Yes` para instalar [GRUB boot](https://es.wikipedia.org/wiki/GNU_GRUB) en el disco duro.
18. Escogeremos el dispositivo para la instalación del cargador de arranque `/dev/sda`.  A esperar. y le damos a `Continue`

**Configuración de la máquina virtual** 

➤  Lo primero que debemos hacer es seleccionar `Debian GNU/Linux`.

➤ Debemos introducir la contraseña de encriptación que utilizamos previamente. En mi caso es `Yowcloud`.

➤ Debemos introducir el usuario y contraseña que hemos creado. En mi caso el usuario es `gusgonza` y la contraseña `Hello42bcn-`.

**Instalación de sudo y configuración de usuarios y grupos** 

1. Para la instalación de sudo primero debemos estar en el usuario root, para ello pondremos `su` en el terminal e introduciremos la contraseña, en mi caso es `Hola42bcn-`. Una vez hemos accedido al usuario root, debemos poner el comando `apt install sudo` para así instalar los paquetes necesarios.
2.  Debemos reiniciar la máquina para que se apliquen los cambios. Para ello haremos uso del comando `sudo reboot` y esperaremos a que se reinicie.
3. Una vez reiniciado debemos volver a introducir las contraseñas de cifrado y del usuario. 
    
    Para verificar que hayamos instalado `sudo` correctamente entraremos de nuevo en el usuario root y pondremos el comando `sudo -V`, este comando además de mostrarnos la versión de sudo también mostrará los argumentos pasados para configurar cuando se creó sudo y los plugins que pueden mostrar información más detallada. 
    
4. Siguiendo en el usuario root crearemos un usuario con nuestro login con el comando `sudo adduser gusgonza` como nosotros ya hemos creado el usuario en la instalación nos debe aparecer que el usuario ya existe.
    
    ![Screen Shot 2024-03-06 at 12.24.49 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.24.49_PM.png)
    
5. Ahora deberemos crear un nuevo grupo llamado `user42`. Para crearlo debemos hacer `sudo addgroup user42`.
    
    **Qué es GID** Es el identificador de grupo, es una abreviatura de Group ID
    
     **Se ha creado correctamente el grupo?** Lo cierto es que sí, ya que no ha habido ningún mensaje de error, aun así podemos comprobar si se ha creado con el comando `getent group nombre_grupo` o también podemos hacer `cat /etc/group` y podremos ver todos los grupos y los usuarios que hay dentro de ellos.
    
    ![Screen Shot 2024-03-06 at 12.26.56 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.26.56_PM.png)
    
6. Con el comando `sudo adduser user group` incluiremos al usuario en el grupo. Debemos incluir al usuario en los grupos `sudo` y `user42`.
    
    ![Screen Shot 2024-03-06 at 12.31.09 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.31.09_PM.png)
    
7. Una vez los hayamos introducido para chequear que todo se haya hecho correctamente podemos ejecutar el comando `getent group nombre_grupo` o también podemos editar el fichero /etc/group `vim /etc/group` y en los grupos `sudo` y `login42` deberá aparecer nuestro usuario.
    
    ![Screen Shot 2024-03-06 at 12.32.07 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.32.07_PM.png)
    

 **Instalación y configuración SSH** 

**Qué es SSH** Es un protocolo y el programa que lo implementa. Su principal función es permitir el acceso remoto a un servidor a través de un canal seguro en el que toda la información se cifra.

1. Lo primero que haremos será ejecutar `sudo apt update` para actualizar los repositorios definidos en el archivo /etc/apt/sources.list.
2. Instalaremos OpenSSH, la herramienta principal para la conectividad de inicio de sesión remoto con el protocolo SSH. Para instalarla, introduciremos el comando `sudo apt install openssh-server`. Cuando aparezca el mensaje de confirmación, escribiremos `Y` y luego esperaremos a que termine la instalación.
    
    Para verificar que se instaló correctamente, ejecutaremos `sudo service ssh status`. Debería aparecer como activo.
    
    ![Screen Shot 2024-03-06 at 12.34.33 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.34.33_PM.png)
    
3. Tras finalizar la instalación, se crean algunos archivos que debemos configurar. Utilizaremos vim para esta tarea, que puedes instalar con `sudo apt install vim`. El primer archivo que editaremos será `/etc/ssh/sshd_config`. Si no estás utilizando el usuario root, no tendrás permisos de escritura. Para conseguirlos, puedes utilizar `su` e ingresar la contraseña para acceder al usuario root, o simplemente agregar sudo al principio del comando: `sudo vim /etc/ssh/sshd_config`.
4. Los `#` al inicio de una línea indican que está comentada; debes eliminar este símbolo en las líneas que vayas a modificar. Al editar el archivo, debes cambiar las siguientes líneas:
    
    ➤ #Port 22 -> Port 4242
    
    ➤ #PermitRootLogin prohibit-password -> PermitRootLogin no
    
    Una vez que hayas hecho estas modificaciones, guarda los cambios y cierra el archivo.
    
    ![Screen Shot 2024-03-06 at 12.40.39 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.40.39_PM.png)
    
5. Ahora debemos editar el fichero  `vim /etc/ssh/ssh_config`.
    
    Editaremos la siguiente línea:
    
    ![Screen Shot 2024-03-06 at 12.41.55 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.41.55_PM.png)
    
    ➤ #Port 22 -> Port 4242
    
    `sudo service ssh restart` para actualizar los cambios
    
    Una vez reseteado, comprobaremos el estado actual con `sudo service ssh status`. Para confirmar que los cambios en la escucha del servidor se han realizado, debe aparecer el Puerto 4242.
    

**Instalación y configuración de UFW**

**¿Qué es [UFW](https://es.wikipedia.org/wiki/Uncomplicated_Firewall)?** Es un [firewall](https://es.wikipedia.org/wiki/Cortafuegos_(inform%C3%A1tica)) que utiliza la línea de comandos para configurar las [iptables](https://es.wikipedia.org/wiki/Iptables) mediante un pequeño número de comandos simples.

1. Lo primero que debemos hacer es instalar UFW. Para ello, utilizaremos el comando `sudo apt install ufw`. A continuación, escribiremos una `y` para confirmar.
2. Una vez instalado, debemos habilitarlo. Para ello, introduciremos el siguiente comando: `sudo ufw enable`. A continuación, nos debe indicar que el firewall está activo.
    
    ![Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.52.46_PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_12.52.46_PM.png)
    
3. Ahora debemos hacer que nuestro firewall permita las conexiones a través del puerto 4242. Lo haremos con el siguiente comando: `sudo ufw allow 4242`.
    
    Este comando sirve para abrir cualquier puerto. Para eliminarlo, activaremos el menú y luego seleccionaremos el puerto a eliminar.
    
4. Por último, comprobaremos que está todo correctamente configurado mirando el estado de nuestro cortafuegos, en donde ya debe aparecer como permitidas las conexiones mediante el puerto 4242. Para ver el estado daremos uso del comando `sudo ufw status`.
    
    ![Screen Shot 2024-03-06 at 1.31.55 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_1.31.55_PM.png)
    

**Configurar contraseña fuerte para sudo** 

1. Crearemos un fichero en la ruta /etc/sudoers.d/ a mi fichero yo le he decidido llamar sudo_config, ya que en ese fichero se almacenará la configuración de la contraseña. El comando exacto para crear el fichero es `touch /etc/sudoers.d/sudo_config`.
2. Debemos crear el directorio sudo en la ruta /var/log porque cada comando que ejecutemos con sudo, tanto el input como el output, debe quedar almacenado en ese directorio. Para crearlo utilizaremos el comando `mkdir /var/log/sudo`.
    
    ![Screen Shot 2024-03-06 at 1.34.17 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_1.34.17_PM.png)
    
3. Debemos editar el fichero creado en el paso 1. Como he comentado anteriormente, puedes utilizar el editor que más te guste, pero yo haré uso de nano. Comando para editar el fichero: `vim /etc/sudoers.d/sudo_config`
4. Una vez estamos editando el fichero deberemos introducir los siguientes comandos para cumplir todos los requisitos que pide él subject. en vin `yy` copia la linea y `p` pega en la siguiente línea.
    
    ```bash
    Defaults  passwd_tries=3
    Defaults  badpass_message="oh, no. Happens & up2u"
    Defaults  logfile="/var/log/sudo/sudo_config"
    Defaults  log_input, log_output
    Defaults  iolog_dir="/var/log/sudo"
    Defaults  requiretty
    Defaults  secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"
    ```
    
    ➤ Cómo debería verse el fichero.
    
    ![Screen Shot 2024-03-06 at 1.51.44 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_1.51.44_PM.png)
    
    - **`passwd_tries=3`**: Limita el número de intentos de contraseña para autenticación.
    - **`badpass_message="Oh, no. Happens & try again!"`**: Define el mensaje mostrado al ingresar una contraseña incorrecta.
    - **`logfile="/var/log/sudo/sudo_config"`**: Especifica la ubicación del archivo de registro de sudo.
    - **`log_input, log_output`**: Registra tanto la entrada como la salida de los comandos ejecutados con sudo.
    - **`iolog_dir="/var/log/sudo"`**: Define el directorio para almacenar registros detallados de entrada/salida.
    - **`requiretty`**: Requiere un terminal asociado para el uso de sudo. Esta línea requiere que un pseudo-terminal (tty) esté asociado con el proceso sudo. Esto es útil para asegurar que sudo solo pueda ser utilizado desde la línea de comandos interactiva y no desde scripts o procesos automatizados.
    - **`secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"`**: Define las rutas seguras para la ejecución de comandos con sudo.
    

**Configuración de política de contraseñas fuerte**  

1. El primer paso será editar el fichero `login.defs. vim /etc/login.defs`
2.  Una vez estemos editando el fichero, modificaremos los siguientes parámetros:
    - PASS_MAX_DAYS 99999 -> PASS_MAX_DAYS 30
    - PASS_MIN_DAYS 0 -> PASS_MIN_DAYS 2
    - PASS_MAX_DAYS: Número máximo de días que se puede utilizar una contraseña. El número corresponde a días. 30
    - PASS_MIN_DAYS: Número mínimo de días permitidos entre cambios de contraseña. 2
    - PASS_WARN_AGE: Número de días de advertencia que se dan antes de que caduque una contraseña. 7
        
        ![Screen Shot 2024-03-11 at 2.28.26 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-11_at_2.28.26_PM.png)
        
3. Para poder seguir con la configuración debemos instalar los siguientes paquetes con este comando `sudo apt install libpam-pwquality` , acto seguido pondremos `Y` para confirmar la instalación y esperaremos a que termine.
    - **`libpam-pwquality`** es una biblioteca que ayuda a implementar políticas de seguridad robustas para contraseñas en sistemas Unix y Linux, mejorando la resistencia contra ataques de fuerza bruta y aumentando la seguridad general del sistema.
4. Lo siguiente que debemos hacer es volver a editar un fichero y modificar algunas líneas. Haremos `vim /etc/pam.d/common-password`.
5. Después de retry=3 debemos añadir los siguientes comandos:
    
    ```bash
    minlen=10 ucredit=-1 dcredit=-1 lcredit=-1 maxrepeat=3
    reject_username difok=7 enforce_for_root
    
    ```
    
    - **`minlen=10`**: Establece la longitud mínima de la contraseña en 10 caracteres.
    - **`ucredit=-1`**: Requiere al menos una letra mayúscula en la contraseña.
    - **`dcredit=-1`**: Requiere al menos un dígito en la contraseña.
    - **`lcredit=-1`**: Requiere al menos una letra minúscula en la contraseña.
    - **`maxrepeat=3`**: Limita la cantidad de veces que un mismo carácter puede repetirse consecutivamente en la contraseña a 3.
    - **`reject_username`**: Prohíbe que la contraseña contenga el nombre de usuario.
    - **`difok=7`**: Requiere que al menos 7 caracteres de la nueva contraseña sean diferentes de los de la contraseña anterior.
    - **`enforce_for_root`**: Aplica estas políticas de seguridad también para el usuario root, asegurando que las contraseñas de root sigan estas reglas para mejorar la seguridad del sistema.
    
    ![Screen Shot 2024-03-11 at 2.33.58 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-11_at_2.33.58_PM.png)
    

**Conectarse vía SSH 🗣 con VMware**

1. Daremos click derecho sobre nuestra máquina y escogeremos la opción `Connect to SSH`.
2. Una vez se nos abra la siguiente pestaña debemos rellenar todos los campos. En port debemos poner `4242` para indicar que queremos conectarnos por ese puerto. Los siguientes campos son el username de tu máquina, en mi caso `gusgonza` y la contraseña del usuario, en mi caso `Hello42spain`.
    
    ![Screen Shot 2024-03-01 at 5.08.19 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-01_at_5.08.19_PM.png)
    
    ![Screen Shot 2024-03-01 at 5.08.40 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-01_at_5.08.40_PM.png)
    
    También podemos conectarnos mediante el terminal, pero debemos sustituir localhost por la IP de la máquina virtual. Quedaría algo así: `ssh gusgonza@192.168.39.1 -p 4242`. para saber tu ip usa `hostname -I`
    
    ![Screen Shot 2024-03-06 at 2.19.19 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_2.19.19_PM.png)
    

 **Script** 

**Qué es un script** 

Es una secuencia de comandos guardada en un fichero que cuando se ejecuta hará la función de cada comando. 

El uso de [WALL](https://aprendiendoausarlinux.wordpress.com/category/comandos-unix/wall/):  Es un comando en sistemas Unix y Linux que se utiliza para enviar un mensaje a todos los usuarios que están actualmente conectados y tienen una sesión abierta en el sistema. El nombre **`wall`** es una abreviatura de "Write to All" (Escribir a Todos).

1. **Architecture**
    
    Para poder ver la arquitectura del SO y su versión de kernel utilizaremos el comando `uname -a` ( "-a" == "--all" ) que básicamente printará toda la información, excepto si el tipo de procesador es desconocido o la plataforma de hardware
    
    ![Screen Shot 2024-03-01 at 5.10.00 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-01_at_5.10.00_PM.png)
    
2.  **Núcleos físicos**
    
    El comando **`grep "physical id" /proc/cpuinfo`** muestra la salida del archivo **`/proc/cpuinfo`** que contiene información sobre los procesadores en tu sistema. Muestra la línea que contiene el texto "physical id".
    
    La salida que has proporcionado indica que tienes un solo ID físico de CPU en tu sistema, ya que solo se muestra un resultado con "physical id: 0". Esto significa que hay un solo conjunto físico de procesadores en tu sistema.
    
    ![Screen Shot 2024-03-06 at 3.23.28 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_3.23.28_PM.png)
    
3. **Núcleos virtuales**
    
    **`grep processor /proc/cpuinfo`**: Este comando busca en el archivo **`/proc/cpuinfo`** todas las líneas que contienen la palabra "processor". Ahora, **`/proc/cpuinfo`** es un archivo especial en sistemas Linux que proporciona información detallada sobre la CPU del sistema. Cada procesador lógico en el sistema está representado por una línea que contiene la palabra "processor".
    
    **`wc -l`**: Este comando cuenta el número de líneas que recibe cómo entrada. Con la opción **`l`**, le estamos diciendo a **`wc`** que cuente las líneas.
    
    Entonces, cuando combinamos ambos comandos, lo que estamos haciendo es buscar todas las líneas en **`/proc/cpuinfo`** que contienen la palabra "processor" y luego contar cuántas líneas encontramos. Dado que cada procesador lógico se representa en una línea diferente en **`/proc/cpuinfo`**, el resultado nos dará el número total de procesadores lógicos detectados en el sistema.
    
    Esperamos obtener un número que represente la cantidad de procesadores lógicos disponibles en el sistema. 
    
    ![Screen Shot 2024-03-06 at 3.26.31 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_3.26.31_PM.png)
    
4. **Memoria RAM**
    
    Uso del AWK
    
    Estás utilizando AWK para extraer y procesar información específica de la salida del comando **`free --mega`**, que muestra información sobre la memoria del sistema en megabytes. Con AWK, estás buscando líneas que comienzan con "Mem:" y extrayendo la memoria usada y total de esas líneas. Luego, estás formateando la salida para mostrar el porcentaje de memoria usada con dos decimales y el símbolo "%". 
    
    1. **`free --mega`**: Este comando muestra información sobre la memoria del sistema, incluyendo la cantidad de memoria usada, libre y reservada para otros usos, utilizando la unidad de medida en megabytes (--mega). Muestra el total de memoria física y virtual en el sistema.
    2. **`awk '$1 == "Mem:" {print $3}'`**: Este comando filtra la salida del comando **`free --mega`**. Utiliza AWK, un poderoso lenguaje de procesamiento de texto, para buscar las líneas donde la primera palabra es "Mem:". Luego, imprime el tercer campo de esas líneas, que corresponde a la memoria usada en megabytes.
        
        **`free --mega | awk '$1 == "Mem:" {print $3}'`**  
        
    3. **`awk '$1 == "Mem:" {print $2}'`**: Similar al anterior, este comando filtra la salida para encontrar las líneas donde la primera palabra es "Mem:". Pero en lugar de imprimir el tercer campo, imprime el segundo campo, que corresponde a la memoria total en megabytes.
        
        **`free --mega | awk '$1 == "Mem:" {print $2}'`**  
        
    4. **`awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}'`**: Nuevamente, filtra la salida para encontrar las líneas donde la primera palabra es "Mem:". Luego, calcula el porcentaje de memoria usada dividiendo la memoria usada entre la memoria total y multiplicando por 100 para obtener el porcentaje. Utiliza **`printf`** para formatear el resultado y mostrar solo dos decimales. También incluye el símbolo "%" al final.
        
        **`free --mega | awk '$1 == "Mem:" {printf("(%.2f%%)\n", $3/$2*100)}'`** 
        
        ![Screen Shot 2024-03-06 at 3.59.04 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_3.59.04_PM.png)
        
5. **Memoria del disco**
    
    Para poder ver la memoria del disco ocupada y disponible utilizaremos el comando `df` que significa "disk filesystem", se utiliza para obtener un resumen completo del uso del espacio en disco. Como en el subject indica la memoria utilizada se muestra en MB, así que entonces utilizaremos el flag -m. 
    
    1. **Uso de `df` para ver el espacio en disco ocupado y disponible**:
        - **`df -m`** muestra el uso del espacio en disco en megabytes.
        - **`grep "/dev/"`** filtra las líneas que contienen "/dev/".
        - **`grep -v "/boot"`** excluye las líneas que contienen "/boot".
        - **`awk '{memory_use += $3} END {print memory_use}'`** suma el tercer campo de cada línea y imprime el resultado, que representa el espacio en disco ocupado en MB.
        
        `df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_use += $3} END {print memory_use}'`
        
    2. **Uso de `df` para ver el espacio total en disco**:
        - **`awk '{memory_result += $2} END {printf ("%.fGb\n"), memory_result/1024}'`** suma el segundo campo de cada línea, convierte el resultado de MB a GB y lo imprime.
        - Para obtener el espacio total utilizaremos un comando muy parecido. Las únicas diferencias serán que los valores que sumaremos serán los $2 en vez de $3 y la otra diferencia es que en el subject aparece el tamaño total en Gb así que como el resultado de la suma nos da el número en Mb debemos transformarlo a Gb, para ello debemos dividir el número entre 1024 y quitar los decimales.
        
        `df -m | grep "/dev/" | grep -v "/boot" | awk '{memory_result += $2} END {printf ("%.fGb\n"), memory_result/1024}'`
        
    3. **Cálculo del porcentaje de uso de memoria**:
        - **`awk '{use += $3} {total += $2} END {printf("(%d%%)\n"), use/total*100}'`** combina los dos comandos anteriores para obtener la memoria usada y total. Luego calcula el porcentaje de uso y lo imprime entre paréntesis con el símbolo "%" al final.
        
        `df -m | grep "/dev/" | grep -v "/boot" | awk '{use += $3} {total += $2} END {printf("(%d%%)\n"), use/total*100}'` 
        
        ![Screen Shot 2024-03-06 at 4.00.10 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_4.00.10_PM.png)
        
    4. **Porcentaje uso de CPU**
        
        **Uso de `vmstat` para ver el porcentaje de uso de CPU**:
        
        **`vmstat`** es un comando utilizado en sistemas operativos Unix y Unix-like (como Linux) para monitorear y reportar estadísticas del sistema relacionadas con la memoria virtual, el procesamiento, la utilización de la CPU y la actividad de los discos. El nombre "vmstat" es una abreviatura de "Virtual Memory Statistics". Este comando proporciona una instantánea de varias métricas del sistema en un intervalo de tiempo específico.
        
    - **`vmstat 1 4 | tail -1 | awk '{print $15}'`** muestra el porcentaje de uso de memoria disponible.
    - Luego, se resta este valor de 100 y se imprime el resultado con un decimal y un "%" al final, en el script.
        1. **`vmstat 1 4`**: Este comando ejecuta el programa **`vmstat`**, que muestra estadísticas del sistema. El flag **`1`** establece un intervalo de actualización de 1 segundo, mientras que el **`4`** indica que se mostrarán los datos durante 4 iteraciones.
        2. **`tail -1`**: Este comando muestra solo la última línea de la salida generada por **`vmstat`**. Como **`vmstat`** produce múltiples líneas de salida con datos en intervalos regulares, solo estamos interesados en la última línea, que contiene la información más reciente.
        3. **`awk '{print $15}'`**: AWK es un programa de procesamiento de texto. En este caso, utilizamos AWK para extraer y mostrar solo el valor del decimoquinto campo de la última línea de la salida de **`vmstat`**. En el contexto de **`vmstat`**, el decimoquinto campo representa el porcentaje de uso de la CPU.
        
        En resumen, este comando en su totalidad nos permite obtener el porcentaje de uso de la CPU en el sistema. Cada parte del comando cumple una función específica: **`vmstat`** recopila las estadísticas del sistema, **`tail -1`** selecciona solo la última línea de esa salida, y **`awk`** extrae el valor del campo que indica el porcentaje de uso de la CPU.
        
        `vmstat 1 4 | tail -1 | awk '{print $15}'`
        
        ![Screen Shot 2024-03-06 at 4.00.51 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_4.00.51_PM.png)
        
6. **Último reinicio**
    
    El comando **`who`** en la terminal de Linux muestra una lista de usuarios actualmente conectados al sistema, junto con detalles como la terminal de sesión y la hora de inicio de sesión. Es útil para verificar quién está utilizando el sistema en un momento dado. Puedes usar el comando **`who`** sin argumentos para obtener una lista básica de usuarios conectados, o puedes agregar opciones como **`-b`** para mostrar la última hora de inicio del sistema, **`-u`** para información adicional sobre la actividad del usuario, o **`-q`** para mostrar solo el número de usuarios conectados.
    
    `who -b | awk '$1 == "system" {print $3 " " $4}'`
    
    En la MV:
    
    ![Screen Shot 2024-03-08 at 10.31.00 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_10.31.00_AM.png)
    
    Por terminal conectado por ssh:
    
    ![Screen Shot 2024-03-06 at 4.01.09 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_4.01.09_PM.png)
    
7. **Uso LVM**
    
    **LVM (Logical Volume Manager):**
    
    - LVM es un sistema de gestión de volúmenes lógicos que proporciona una capa de abstracción sobre los discos físicos.
    - Permite la creación, redimensionamiento y administración de volúmenes lógicos de manera dinámica.
    - Facilita tareas como la agregación de múltiples discos físicos, creación de instantáneas y migración de datos.
    1. **`lsblk`**: Este comando muestra información sobre los dispositivos de bloque en el sistema, como discos duros, SSD, entre otros.
    2. **`grep "lvm"`**: El resultado de **`lsblk`** se filtra con **`grep`** para buscar líneas que contengan la cadena "lvm". Esto nos ayuda a identificar si hay dispositivos que están gestionados por LVM.
    3. **`wc -l`**: El resultado de **`grep`** se pasa a **`wc -l`**, que cuenta el número de líneas que contienen la cadena "lvm". Esto nos dará el número total de dispositivos gestionados por LVM.
    4. **`if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi`**: En este comando condicional (**`if`**), se verifica si el número de líneas que contienen "lvm" es mayor que 0. Si es así, significa que hay dispositivos gestionados por LVM, por lo que se imprime "yes". De lo contrario, se imprime "no".
        1. **`if`**: Inicia una estructura de control condicional en el script de shell. Permite ejecutar un bloque de comandos si se cumple una condición especificada.
        2. **`[ $(lsblk | grep "lvm" | wc -l) -gt 0 ]`**: Esta es la condición del **`if`**. Aquí se realiza una serie de comandos dentro de la expansión de comandos **`$(...)`** para verificar si LVM está activo en el sistema.
            - **`lsblk`**: Lista los dispositivos de bloque en el sistema.
            - **`grep "lvm"`**: Filtra las líneas que contienen la cadena "lvm".
            - **`wc -l`**: Cuenta el número total de líneas que contienen "lvm".
            - **`gt 0`**: Compara si el número de líneas es mayor que 0.
        3. **`then`**: Marca el inicio del bloque de comandos que se ejecutarán si la condición del **`if`** se evalúa como verdadera.
        4. **`echo yes`**: Imprime "yes" en la salida estándar si LVM está activo en el sistema.
        5. **`else`**: Marca el inicio del bloque de comandos que se ejecutarán si la condición del **`if`** se evalúa como falsa.
        6. **`echo no`**: Imprime "no" en la salida estándar si LVM no está activo en el sistema.
        7. **`fi`**: Marca el final de la estructura de control condicional. Indica el final del bloque de comandos del **`if`**.
            
            ![Screen Shot 2024-03-08 at 10.24.43 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_10.24.43_AM.png)
            
        
        En resumen, este comando permite determinar si LVM está activo en el sistema, mostrando "yes" si lo está y "no" si no lo está, facilitando así la verificación del estado de LVM en el sistema.
        
        - **PV (Physical Volume)**: Es un volumen físico, lo cual es un dispositivo de almacenamiento físico, como un disco duro o una partición de disco, que se utiliza como base para el almacenamiento en LVM (Logical Volume Management). En resumen, es una unidad física de almacenamiento que se integra en el sistema LVM.
        - **LV (Logical Volume)**: Es un volumen lógico, creado dentro de un volumen físico (PV) o un conjunto de ellos. Los LVs son similares a las particiones de disco tradicionales, pero con ventajas adicionales. Se pueden redimensionar fácilmente, mover entre diferentes sistemas físicos y se pueden administrar de manera más flexible que las particiones tradicionales. Los LVs se utilizan como bloques de construcción para montar sistemas de archivos, volúmenes de intercambio (swap), entre otros usos de almacenamiento en Linux.
        
        En resumen, PVs son dispositivos de almacenamiento físico, mientras que LVs son volúmenes lógicos que se crean utilizando PVs. Juntos, forman la infraestructura de almacenamiento gestionada por LVM en sistemas Linux.
        
    
8. **Conexiones TCP**
    
    Las conexiones TCP (Transmission Control Protocol) son conexiones de red establecidas entre dos dispositivos en una red que utilizan el protocolo TCP para comunicarse entre sí de manera confiable y orientada a la conexión. TCP es uno de los protocolos fundamentales en el modelo de referencia de interconexión de sistemas abiertos (OSI), en la capa de transporte.
    
    Entonces: las conexiones TCP con SSH (Secure Shell) son conexiones de red establecidas utilizando el protocolo TCP y se emplean para establecer sesiones seguras entre dos dispositivos en una red.
    
    El comando **`ss -ta | grep ESTAB | wc -l`** se utiliza para contar el número de conexiones TCP establecidas en el sistema. Aquí está una explicación detallada de cada parte del comando:
    
    1. **`ss -ta`**: Este comando **`ss`** muestra información sobre los sockets. Con el flag **`ta`**, estamos filtrando para mostrar solo las conexiones TCP establecidas.
    2. **`grep ESTAB`**: Utilizamos **`grep`** para filtrar las líneas que contienen "ESTAB", que indica que la conexión está establecida.
    3. **`wc -l`**: Este comando cuenta el número de líneas que se pasan a través de él. En este caso, contará el número de conexiones TCP establecidas que se han filtrado previamente.
    
    En resumen, el comando **`ss -ta | grep ESTAB | wc -l`** nos proporciona el número total de conexiones TCP establecidas en el sistema en un momento dado.
    
    ![Screen Shot 2024-03-08 at 10.38.10 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_10.38.10_AM.png)
    
9. **Número de usuarios**
    
    El comando **`users | wc -w`** se utiliza para contar el número de usuarios actualmente conectados al sistema. Aquí está una explicación de cada parte del comando:
    
    1. **`users`**: Este comando muestra los nombres de usuario de las personas que están actualmente conectadas al sistema.
    2. **`|`**: Es un operador de tubería que redirige la salida del comando anterior como entrada al siguiente comando.
    3. **`wc -w`**: El comando **`wc`** (word count) se utiliza para contar palabras en la entrada que recibe. Con el flag **`w`**, **`wc`** contará el número de palabras que se le pasan a través de la tubería.
    
    En resumen, **`users | wc -w`** nos proporciona el número de usuarios que están actualmente conectados al sistema.
    
    ![Screen Shot 2024-03-08 at 10.39.21 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_10.39.21_AM.png)
    
10. **Dirección IP y MAC**
    1. Conseguir la dirección ip del dispositivo: `hostname -I`
        
        ![Screen Shot 2024-03-08 at 10.40.54 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_10.40.54_AM.png)
        
    2. **`ip link`**: Este comando muestra información sobre las interfaces de red del sistema.
    3. **`|`**: Es un operador de tubería que redirige la salida del comando anterior como entrada al siguiente comando.
    4. **`grep "link/ether"`**: Utilizamos **`grep`** para filtrar las líneas que contienen la cadena "link/ether", que es la línea que contiene la dirección MAC.
    5. **`awk '{print $2}'`**: El comando **`awk`** se utiliza para procesar y manipular datos de texto. Con **`{print $2}`**, estamos especificando que solo queremos imprimir la segunda columna de la salida de **`grep`**, que es la dirección MAC.
    
    En resumen, el comando **`ip link | grep "link/ether" | awk '{print $2}'`** nos proporciona la dirección MAC de la interfaz de red del sistema.
    
    ![Screen Shot 2024-03-08 at 10.42.16 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_10.42.16_AM.png)
    
11. **Número de comandos ejecutados con sudo**
    
    El comando **`journalctl _COMM=sudo | grep COMMAND | wc -l`** se utiliza para contar el número de comandos que se ejecutan con **`sudo`** y se registran en los registros del sistema. Aquí está una explicación detallada de cada parte del comando:
    
    1. **`journalctl _COMM=sudo`**: Este comando **`journalctl`** se utiliza para mostrar y administrar los registros del sistema. 
        
        Con **`_COMM=sudo`**, estamos filtrando los registros para mostrar solo aquellos relacionados con comandos ejecutados con **`sudo`**.
        
    2. **`|`**: Es un operador de tubería que redirige la salida del comando anterior como entrada al siguiente comando.
    3. **`grep COMMAND`**: Utilizamos **`grep`** para filtrar las líneas que contienen la palabra "COMMAND", lo que nos permite seleccionar solo las líneas que representan comandos ejecutados.
    4. **`wc -l`**: El comando **`wc`** (word count) se utiliza para contar las líneas en la entrada que recibe. Con el flag **`l`**, **`wc`** contará el número de líneas que se le pasan a través de la tubería.
    
    En resumen, el comando **`journalctl _COMM=sudo | grep COMMAND | wc -l`** nos proporciona el número total de comandos ejecutados con **`sudo`** y registrados en los registros del sistema.
    
    ![Screen Shot 2024-03-08 at 11.21.26 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_11.21.26_AM.png)
    
12. Resultado del script

```bash
##!/bin/bash

# System Architecture
architecture=$(uname -a)

# Physical CPUs
physical_cpus=$(grep "physical id" /proc/cpuinfo | wc -l)

# Virtual CPUs
virtual_cpus=$(grep "processor" /proc/cpuinfo | wc -l)

# RAM Usage
ram_total=$(free --mega | awk '$1 == "Mem:" {print $2}')
ram_used=$(free --mega | awk '$1 == "Mem:" {print $3}')
ram_percentage=$(free --mega | awk '$1 == "Mem:" {printf("%.2f"), $3/$2*100}')

# Disk Usage
disk_total=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{total += $2} END {printf ("%.1fGb\n"), total/1024}')
disk_used=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{used += $3} END {print used}')
disk_percentage=$(df -m | grep "/dev/" | grep -v "/boot" | awk '{used += $3} {total+= $2} END {printf("%d"), used/total*100}')

# CPU Load
cpu_load=$(vmstat 1 2 | tail -1 | awk '{printf $15}')
cpu_occupied=$(expr 100 - $cpu_load)
cpu_final=$(printf "%.1f" $cpu_occupied)

# Last System Boot
last_boot=$(who -b | awk '$1 == "system" {print $3 " " $4}')

# LVM Usage
lvm_usage=$(if [ $(lsblk | grep "lvm" | wc -l) -gt 0 ]; then echo yes; else echo no; fi)

# TCP Connections
tcp_connections=$(ss -ta | grep ESTAB | wc -l)

# User Logins
user_logins=$(users | wc -w)

# Network
ip=$(hostname -I)
mac=$(ip link | grep "link/ether" | awk '{print $2}')

# Sudo
sudo_commands=$(journalctl _COMM=sudo | grep COMMAND | wc -l)

# Send message to all users
wall "
	================================
        	 SYSTEM INFORMATION
	--------------------------------
	- Architecture: $architecture
	- Physical CPUs: $physical_cpus
	- Virtual CPUs: $virtual_cpus
	- RAM Usage: $ram_used/${ram_total}MB ($ram_percentage%)
	- Disk Usage: $disk_used/${disk_total} ($disk_percentage%)
	- CPU Load: $cpu_final%
	- Last System Boot: $last_boot
	- LVM Usage: $lvm_usage
	- TCP Connections: $tcp_connections ESTABLISHED
	- User Logins: $user_logins
	- Network: IP $ip ($mac)
	- Sudo Commands: $sudo_commands commands
	================================
"
```

1. **ARCH**: Obtiene y almacena la arquitectura del sistema usando **`uname -a`**.
2. **CPU PHYSICAL**: Cuenta el número de IDs físicos de CPU utilizando **`grep`** y **`wc`**.
3. **CPU VIRTUAL**: Cuenta el número de procesadores virtuales utilizando **`grep`** y **`wc`**.
4. **RAM**: Obtiene y almacena la cantidad total de RAM, la cantidad utilizada y el porcentaje utilizado utilizando el comando **`free`** y el comando **`awk`**.
5. **DISK**: Obtiene y almacena la cantidad total y utilizada de espacio en disco, así como el porcentaje utilizado utilizando **`df`**, **`grep`** y **`awk`**.
6. **CPU LOAD**: Calcula la carga promedio de la CPU utilizando **`vmstat`**, **`tail`** y **`awk`**.
7. **LAST BOOT**: Obtiene y almacena la fecha y hora del último inicio del sistema utilizando **`who -b`** y **`awk`**.
8. **LVM USE**: Comprueba si LVM está en uso en el sistema utilizando **`lsblk`**, **`grep`** y un condicional en shell.
9. **TCP CONNEXIONS**: Cuenta el número de conexiones TCP establecidas utilizando **`ss`** y **`grep`**.
10. **USER LOG**: Cuenta el número de usuarios conectados utilizando **`users`** y **`wc`**.
11. **NETWORK**: Obtiene y almacena la dirección IP y la dirección MAC de la máquina utilizando **`hostname -I`** y **`ip link`**.
12. **SUDO**: Cuenta el número de comandos sudo ejecutados utilizando **`journalctl`** y **`grep`**.
13. **WALL:**  Envía un mensaje a todos los usuarios del sistema mostrando la información recopilada.

# **Crontab ⏰**

Para tener correctamente crontab configurado debemos editar el fichero crontab con el siguiente comando `sudo crontab -u root -e`.

En el fichero debemos añadir el siguiente comando para que el script se ejecute cada 10 minutos `*/10 * * * * sh /ruta del script`.

**Crontab**: Es una utilidad en sistemas Unix y Unix-like que se utiliza para programar tareas que se ejecutan de forma periódica en segundo plano. Estas tareas pueden ser comandos simples, scripts o cualquier otra operación que desees automatizar en tu sistema. Es un administrador de procesos en segundo plano.

**Archivo crontab**: Es un archivo de texto plano que contiene las instrucciones para el programa crontab. Cada usuario puede tener su propio archivo crontab, donde puede programar tareas que se ejecutarán bajo su cuenta de usuario. También hay un archivo crontab para el usuario root, que puede contener tareas que se ejecutan con privilegios de superusuario.

**Sintaxis de crontab**: Cada línea en el archivo crontab sigue un formato específico. Hay cinco campos separados por espacios que especifican cuándo se debe ejecutar una tarea:

1. Minutos (0-59)
2. Horas (0-23)
3. Día del mes (1-31)
4. Mes (1-12 o nombres de los meses)
5. Día de la semana (0-7 o nombres de los días de la semana, donde 0 y 7 representan domingo)

Para programar una tarea, debes escribir estos campos en el orden mencionado, seguidos por el comando que deseas ejecutar. Además, puedes utilizar asteriscos (*) para indicar "cada" en cada campo, o puedes especificar intervalos, listas o rangos de valores.

Por ejemplo, la línea **`*/10 * * * * sh /ruta_del_script`** significa:

- Se ejecuta cada 10 minutos (**`/10`**) en cualquier hora (**``**), cualquier día del mes (**``**), cualquier mes (**``**), y cualquier día de la semana (**``**).
- El comando a ejecutar es **`sh /ruta_del_script`**, donde **`sh`** es el intérprete de comandos que se utilizará y **`/ruta_del_script`** es la ubicación del script que deseas ejecutar.
- **`*/10`** indica que el comando debe ejecutarse en intervalos de 10 minutos. Si solo se pon, entonces se ejecutaría solo a los minutos 10 de cada hora.

Al agregar esta línea al archivo crontab y guardar los cambios, el script se ejecutará automáticamente cada 10 minutos según la programación especificada.

# **Signature.txt**

- Para garantizar la integridad de nuestros archivos, es esencial comprender cómo funcionan los comandos que utilizamos. Uno de ellos es **`shasum`**, una herramienta poderosa para verificar la integridad de los archivos mediante el cálculo de la suma de comprobación del hash SHA-1. Pero, ¿qué significa eso exactamente?
    
    Imagina que cada archivo tiene una huella digital única. Esta huella digital se calcula utilizando un algoritmo específico, en este caso, SHA-1. Cuando ejecutas **`shasum nombremaquina.vmdk`**, estás instruyendo al sistema para que calcule la huella digital del archivo "Virtual Disk.vmdk" utilizando el algoritmo SHA-1.
    
    Esta huella digital, o firma, es como una firma única para ese archivo en particular. Si el contenido del archivo cambia, por más mínimo que sea, la firma también cambiará. Por lo tanto, al calcular la firma de un archivo en un momento específico, puedes estar seguro de que cualquier cambio en el archivo se reflejará en una firma diferente.
    
    Ahora, es importante recordar que una vez que encendemos la máquina virtual o realizamos cambios en ella, la firma del archivo puede cambiar. Por eso es crucial que apaguemos la máquina antes de calcular la firma. Además, debemos asegurarnos de no volver a abrir la máquina después de calcular la firma, ya que cualquier modificación podría alterar la firma.
    
    Una práctica recomendada para realizar correcciones sin comprometer la integridad de los archivos es clonar la máquina virtual. Al clonarla, podemos realizar cambios sin temor a que la firma del archivo original se vea afectada. Esto garantiza que nuestra firma permanezca constante y confiable para su posterior inclusión en nuestro archivo "signature.txt" y su carga en el repositorio de la intranet.
    
    En resumen, **`shasum`** es una herramienta valiosa que nos permite verificar la integridad de nuestros archivos mediante el cálculo de una firma única. Al comprender su funcionamiento y seguir buenas prácticas, podemos mantener la integridad de nuestros datos y archivos de manera efectiva.
    

![Screen Shot 2024-03-09 at 1.32.24 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-09_at_1.32.24_PM.png)

Esto debe de guardarse en el signature.txt que a su vez se debe subir al repositorio de entrega. 

- Para hacer este paso la MV debe estar apagada y no volver a abrirlo hasta la evaluacióncha

Clona tu MV para las tres evaluaciones y un 3 para que vayas testeando cosas sin tocar el original, con el comando

 `cp -r Born2beroot.vmwarevm nombre_copy.vmwaremv`

![Screen Shot 2024-03-09 at 4.04.58 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-09_at_4.04.58_PM.png)

para comprobar el shasum seria de esta manera

![Screen Shot 2024-03-09 at 4.06.38 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-09_at_4.06.38_PM.png)

Tenemos que incluir estas MMVV en VMwatre. opcion de `window` → `virtual machine library` simplemente hacemos `open .` en donde comprobamos el `shasum` y arrastramos a la ventana que de la `VMware`

Al arrastrarlo, tendremos que cambiar el nombre de la MV agregada

![Screen Shot 2024-03-09 at 4.23.00 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-09_at_4.23.00_PM.png)

simplemente hacemos referencias con los nombres que queramos

![Screen Shot 2024-03-09 at 4.24.54 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-09_at_4.24.54_PM.png)

Hemos abierto el `copy_3` que tiene como nombre `test`, y al entrar a el se ha modificado, entonces en este podemos testear mientras esperamos las evaluaciones.

![Screen Shot 2024-03-09 at 4.27.41 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-09_at_4.27.41_PM.png)

Guardar el resultado del `shasum` en el `.txt` en tu repositorio

![Screen Shot 2024-03-09 at 4.33.26 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-09_at_4.33.26_PM.png)

# **OTROS**

> El comando **`head -n 2 /etc/os-release`** se utiliza en sistemas Linux para mostrar las primeras dos líneas del archivo **`/etc/os-release`**. Este archivo proporciona información sobre la distribución y la versión del sistema operativo en el que está instalado.
> 

![Screen Shot 2024-03-08 at 11.34.34 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_11.34.34_AM.png)

> El comando **`/usr/sbin/aa-status`** se utiliza en sistemas Linux que tienen instalado el paquete AppArmor. Este comando se utiliza para verificar el estado actual de AppArmor, un sistema de seguridad de acceso obligatorio (MAC) para el control de acceso a programas.
> 

Cuando se ejecuta **`aa-status`**, proporciona información sobre el estado de los perfiles de AppArmor cargados, incluidos los perfiles activos, inactivos y no aplicados, así como también información sobre los procesos que están siendo gestionados por AppArmor.

![Screen Shot 2024-03-08 at 11.33.33 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_11.33.33_AM.png)

- La línea "apparmor module is loaded." indica que el módulo de AppArmor está cargado en el kernel del sistema, lo que significa que AppArmor está activo y funcionando.
- Hay 7 perfiles de AppArmor cargados.
- Todos los 7 perfiles están en modo de aplicación (enforce mode), lo que significa que se están aplicando restricciones de seguridad según lo definido por estos perfiles.
- Se muestra una lista de los perfiles en modo de aplicación, que incluyen:
    - **`/usr/lib/NetworkManager/nm-dhcp-client.action`**
    - **`/usr/lib/NetworkManager/nm-dhcp-helper`**
    - **`/usr/lib/connman/scripts/dhclient-script`**
    - **`/sbin/dhclient`** y **`/usr/sbin/dhclient`**
    - **`lsb_release`**
    - **`nvidia_modprobe`** y **`nvidia_modprobe//kmod`**
- No hay perfiles en modo de queja (complain mode) o en modo de matar (kill mode).
- No hay perfiles en modo sin restricciones (unconfined mode).
- Hay un proceso que tiene un perfil definido, que es **`/usr/sbin/dhclient`** y está en modo de aplicación (enforce mode).

En resumen, este informe indica que AppArmor está activo y aplicando restricciones de seguridad a los procesos especificados por los perfiles cargados en el sistema.

El comando **`ss -tulp`** se utiliza para mostrar las conexiones de red y los puertos en escucha en un sistema Linux. Aquí está el significado de cada parte del comando:

- **`ss`**: Es una herramienta de línea de comandos utilizada para obtener información sobre las conexiones de red, los sockets y la tabla de enrutamiento en Linux.
- **`t`**: Este argumento indica que solo se mostrarán las conexiones TCP.
- **`u`**: Este argumento indica que solo se mostrarán las conexiones UDP.
- **`l`**: Este argumento indica que solo se mostrarán los puertos en escucha (listening ports).
- **`p`**: Este argumento muestra el proceso que está utilizando cada conexión o puerto.

Cuando ejecutas **`ss -tulp`**, obtendrás una lista de las conexiones TCP y los puertos en escucha, junto con el proceso que está utilizando cada uno de ellos.

![Screen Shot 2024-03-08 at 11.36.47 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_11.36.47_AM.png)

# **BONUS-PARTICIONES**

Necesitamos que sea la opción manual para poder crear las particiones primarias, extendidas y lógicas. 

Descripción breve de todos los tipos de particiones:

◦ **Primaria:** La única partición en la que puede estar instalada un SO. Solo puede haber 4 particiones primarias por disco duro o 3 primarias y una extendida.

◦ **Secundario/Extendida:** Fue ideada para romper la limitación de 4 particiones primarias en un solo disco físico. Solo puede existir una partición de este tipo por disco, y solo sirve para contener particiones lógicas.

◦ **Lógica:** Ocupa una porción de la partición extendida/primaria o la totalidad de la misma, la cual se ha formateado con un tipo específico de sistema de archivos (en nuestro caso usaremos ext4) y se le ha asignado una unidad, así el sistema operativo reconoce las particiones lógicas o su sistema de archivos. Puede haber un máximo de 23 particiones lógicas en una partición extendida, sin embargo, Linux, el SO con el que trabajamos actualmente, lo reduce a 15, más que suficientes para realizar este proyecto.

![Screen Shot 2024-03-06 at 10.41.23 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_10.41.23_AM.png)

Creamos el sd1 de tamaño 500M y tendremos que elegir la opción de localización para la nueva partición en 'Beginning' del disco. Modificamos el punto de montaje a que sea Boot y continuaremos

Ahora debemos crear una partición lógica con todo el espacio disponible del disco (max), que no tenga punto de montaje y que esté encriptada (la extendida)

![Screen Shot 2024-03-06 at 10.58.24 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_10.58.24_AM.png)

Ahora pasaremos a encriptar los volumne tal como pide el subject:

![Screen Shot 2024-03-06 at 10.52.53 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_10.52.53_AM.png)

y tenemos que Crear el volumen encriptado, que en este caso es el no montado

![Screen Shot 2024-03-06 at 10.55.49 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_10.55.49_AM.png)

En este caso ya esta encriptado, si es la primera vex saldria ext4 y no crypto, pero se veria asi por primera vez

![Screen Shot 2024-03-06 at 11.02.13 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.02.13_AM.png)

Aceptamos el mensaje de confirmación. Nos comenta que se encriptara todo lo que hay dentro de la partición y que no debe tardar mucho en terminar. 

Nos da igual si tarda mucho o poco, le damos a cancel, ya que no hay nada que encriptar, debido a que la partición está vacía. Y pondremos la contaseña para encriptarla

Pasamos a configurar los volumenes logicos

Guardaremos los cambios realizados previamente, es como usar w

![Screen Shot 2024-03-06 at 11.06.09 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.06.09_AM.png)

podemos ver el proceso de los cambiios que vamos haciendo a los volumenes con la opcion de display

En este caso, ya está encriptado. Si es la primera vez, aparecería ext4 y no crypto, pero se vería así por primera vez:

![Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.02.13_AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.02.13_AM.png)

Aceptamos el mensaje de confirmación. Nos indica que se encriptará todo lo que hay dentro de la partición y que no debería tardar mucho en terminar.

No importa si tarda mucho o poco, le damos a cancelar, ya que no hay nada que encriptar, debido a que la partición está vacía. Luego, ingresaremos la contraseña para encriptarla.

Pasamos a configurar los volúmenes lógicos.

Guardaremos los cambios realizados previamente, es como usar w.

![Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.06.09_AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.06.09_AM.png)

Podemos ver el proceso de los cambios que vamos haciendo a los volúmenes con la opción de display.

Crearemos un nuevo grupo de volumen. Los grupos de volúmenes agrupan particiones. como sale en el subject LVMGroup-xxx, en nuestro caso la partición tenemos que agrupar el sda5_crypt que es la que hemos encriptado

El *LVM* (*Gestor de volúmenes lógicos, Logical Volume Manager*) es una de mis funcionalidades preferidas en *Linux*.

![Screen Shot 2024-03-06 at 11.12.38 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.12.38_AM.png)

Entonces, creamos el volumen lógico. Seleccionamos el grupo con el nombre de 'root' y le añadimos un tamaño de 10G.

Creamos otro volumen lógico con el mismo grupo con el nombre de swap de tamaño 2.3g

![Screen Shot 2024-03-06 at 11.25.26 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.25.26_AM.png)

Creamos otro volumen lógico con el mismo grupo con el nombre de ‘home’ de tamaño 5g

Creamos otro volumen lógico con el mismo grupo con el nombre de var de tamaño 3g

Creamos otro volumen lógico con el mismo grupo con el nombre de srv de tamaño 3g

Creamos otro volumen lógico con el mismo grupo con el nombre de tmp de tamaño 3g

Creamos otro volumen lógico con el mismo grupo con el nombre de var-log de tamaño 4g

![Screen Shot 2024-03-06 at 11.31.25 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.31.25_AM.png)

Resumen de lo que acabas de crear dando a Display

Podemos observar los cambios realizados a los volúmenes utilizando la opción "display".

Primero, crearemos un nuevo grupo de volúmenes. Estos grupos agrupan particiones, como se indica en el subject LVMGroup-xxx. En nuestro caso, debemos agrupar la partición sda5_crypt, que es la que hemos encriptado.

El *LVM* (*Gestor de volúmenes lógicos, Logical Volume Manager*) es una de mis funcionalidades preferidas en *Linux*.

![Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.12.38_AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.12.38_AM.png)

A continuación, creamos el volumen lógico. Seleccionamos el grupo con el nombre 'root' y le asignamos un tamaño de 10G.

Creamos otro volumen lógico en el mismo grupo con el nombre 'swap' y un tamaño de 2.3G.

![Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.25.26_AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.25.26_AM.png)

Creamos otros volúmenes lógicos en el mismo grupo con los siguientes nombres y tamaños:

- 'home' con un tamaño de 5G
- 'var' con un tamaño de 3G
- 'srv' con un tamaño de 3G
- 'tmp' con un tamaño de 3G
- 'var-log' con un tamaño de 4G

![Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.31.25_AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.31.25_AM.png)

Para finalizar, puedes ver un resumen de lo que acabas de crear seleccionando "Display".

Ahora podemos observar cómo en el apartado donde nos muestran todas nuestras particiones y espacio libre ya aparecen todas las particiones lógicas que acabamos de crear. 

Debemos configurar todas para seleccionar el sistema de archivos que queremos y el punto de montaje que indica el subject. De nuevo iremos por orden y seleccionaremos la primera que nos aparece que es `home`.

Nos muestra la configuración de la partición. Debemos escoger un sistema de ficheros ya que actualmente no tiene. y tenemos que darle de tipo ext4

![Screen Shot 2024-03-06 at 11.35.38 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.35.38_AM.png)

Primero, seleccionamos "home" como el punto de montaje y luego hacemos clic en "Done".

Repetimos el proceso para los siguientes puntos de montaje:

- "root" con el sistema de archivos ext4 y el punto de montaje en "/"
- "srv" con el sistema de archivos ext4 y el punto de montaje en "/srv"
- "swap" con el sistema de archivos swap
- "tmp" con el sistema de archivos ext4 y el punto de montaje en "tmp"
- "var" con el sistema de archivos ext4 y el punto de montaje en "var"
- "var-log" con el sistema de archivos ext4 y el punto de montaje en "var/log"

Después de seleccionar cada punto de montaje, hacemos clic en "Done".

![Screen Shot 2024-03-06 at 11.47.18 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.47.18_AM.png)

Acepta el mensaje y así se guardarán los cambios. Asegúrate de que todas las particiones quedan tal como se solicita.

![Screen Shot 2024-03-06 at 11.47.37 AM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-06_at_11.47.37_AM.png)

continuaremos con la instalación previa.

# **Resumen**

## Qué es una MV?

Una máquina virtual es como una computadora dentro de otra computadora. Utiliza un programa especial para dividir los recursos de la computadora principal y crear un entorno separado donde puedes instalar y ejecutar diferentes sistemas operativos y programas. Es útil para probar software, ejecutar programas incompatibles o experimentar de forma segura sin afectar tu computadora principal.

## Elección de S.O.

Por recomendación, si no has manejado previamente alguna distribución de SO se recomenda Debian. En mi caso, no es la primera vez que instalo un SO como Debian o otro SO.

## Diferencias fundamentales entre Rocky y Debian

Debian se usa en variedad de entornos , donde su estabilidad y la filosofía de software libre. Es inestable cuando hay versiones nuevas . Uso gestión de paquetes  at y UFW con gestor de firewall

Rocky linux  es para el mundo empresarial y organizaciones. Tiene compatibilidad con aplicaciones y servicios desarrollados para Red Hat Enterprise Linux. Mas estable al sacar nuevas versiones  cada much tiempo. Gestión de paquetes yum/dnf y FirewallD como gestor de Firewall.

## Proposito de la mv

Las máquinas virtuales son entornos virtuales que permiten ejecutar múltiples sistemas operativos y aplicaciones en un solo hardware. Son útiles para optimizar recursos, consolidar infraestructuras y proporcionar seguridad a través del aislamiento de procesos.

## Diferencias entre APT y APTITUDE .

[README](https://blog.packagecloud.io/know-the-difference-between-apt-and-aptitude/#:~:text=Apt%20offers%20a%20command%2Dline,of%20all%20available%20official%20packages)  Advanced Packaging Tool

- **Interfaz de usuario**: **`apt`** ofrece una interfaz de línea de comandos básica, mientras que **`aptitude`** ofrece una interfaz más visual e interactiva.
- **Resolución de conflictos**: Cuando hay conflictos de paquetes, **`apt`** no resuelve el problema automáticamente, mientras que **`aptitude`** sugiere posibles soluciones para resolverlo.
- **Registro de cambios**: **`aptitude`** puede mostrar interactivamente el registro de cambios de Debian para todos los paquetes disponibles.
- **Facilidad de uso para principiantes**: **`aptitude`** es más amigable para los principiantes, ya que ofrece una capa de abstracción sobre los diferentes subcomandos, lo que puede resultar más fácil de manejar que **`apt`**, que requiere más conocimientos de línea de comandos y administración de sistemas Linux.

## APPArmor

[AppArmor](https://computernewage.com/2022/09/03/gnu-linux-apparmor-tutorial/#apparmor-introduccion) es un sistema de seguridad para Linux que controla el acceso de las aplicaciones a recursos del sistema, como archivos y puertos de red, mediante perfiles de seguridad. Ayuda a proteger contra vulnerabilidades y ataques. (**mecanismo de control de acceso**)

## Comandos útiles:

1. Interfaz gráfica
    
    Comprobar que no haya ninguna interfaz gráfica en uso. `ls /usr/bin/*session`
    
    ![Screen Shot 2024-03-08 at 3.07.03 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_3.07.03_PM.png)
    
2. Uso del UFW  uncomplicated Firewall
    
    Comprobar si el UFW esta activo. `sudo ufw status`
    
    ![Screen Shot 2024-03-08 at 3.10.56 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_3.10.56_PM.png)
    
    Comprobar el servicio del ufw
    
    ![Screen Shot 2024-03-08 at 3.12.51 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_3.12.51_PM.png)
    
3. SSH secure shell
    
    Necesitamos comprobar el status del [ssh](https://www.notion.so/Born2beRoot-21c033c4ebdf4c74b71f402b29b61b3d?pvs=21)  `sudo service ssh status` 
    
    ![Screen Shot 2024-03-08 at 3.25.18 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_3.25.18_PM.png)
    
4. Seguro que estas utilizando SO Debian?
    
    `uname -v` o `uname —kernel-version`
    
    ![Screen Shot 2024-03-08 at 3.27.45 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_3.27.45_PM.png)
    
5. Agregaste correctamente tu usuario al grupo **sudo** y **user42**?
    
    La palabra "getent" es una abreviatura de "get entries". En el contexto del comando **`getent`** en sistemas Unix y Unix-like, significa obtener las entradas o información de una base de datos del sistema. El comando se utiliza para recuperar información de bases de datos de sistemas como **`/etc/passwd`**, **`/etc/group`**, **`/etc/hosts`** y otros.
    
    Usa los comandos `getent group sudo` y `getent group user42`
    
    ![Screen Shot 2024-03-08 at 3.29.47 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_3.29.47_PM.png)
    
    **Normativa de contraseñas**
    
    - En **`vim /etc/login.defs`**: Este archivo contiene la configuración predeterminada del sistema para el inicio de sesión de usuarios. Algunas de las configuraciones comunes:
        - La expiración de contraseña
        - Número de días permitido antes de modificar la contraseña
        - El aviso al user antes de que expire su contraseña
    - En **`vim /etc/pam.d/common-password`**: PAM (Pluggable Authentication Modules) es un sistema flexible para la autenticación en sistemas Unix/Linux. Este archivo especifica la configuración de los módulos de autenticación utilizados para verificar las contraseñas de los usuarios durante el inicio de sesión.
        - Longitud mínimo 10
        - Contener una mayúscula
        - Contener un número
        - No puede tener mas de 3 veces consecutivas el mismo carácter
        - No puede contener el nombre del user
        - La contraseña del root  como mínimo 7 caracteres que no sean de la antigua contraseña
        - Esta política de contraseña se aplica en el root
6. Te acuerdas de crear un user?
    
    `sudo adduser nameUser` y luego la contraseña requerida (con las políticas agregadas)
    
7. Te acuerdas de crear un grupo?
    
    `sudo addgroup evaluating`
    
8. Recuerdas cómo agregar el nuevo user al nuevo grupo?
    
    `sudo adduser nameUser evaluating`
    
    Comprobar el comando
    
    `getent group evaluating`
    
    - **Por qué esta se implementa esta politica de contraseñas y cuales son sus ventajas y desventajas**
        - Ventajas de esta politica de contraseñas
            - Están diseñadas para mejorar la seguridad de tu sistema al imponer requisitos específicos en las contraseñas de los usuarios.
    - **Ventajas de la implementación:**
        - Mayor seguridad
        - Protección contra ataques de diccionario
        - Protección contra reutilización de contraseñas antiguas
        - Cumplimiento de estándares de seguridad
    - **Desventajas de la implementación:**
        - Posible complejidad para los usuarios
        - Bloqueo de usuarios legítimos
        - Posible resistencia a la implementación
        - Posibles problemas de usabilidad
9. Obtener el nombre del hostname
    
    `hostname`
    
10. Modificar el hostname por otro nombre.
    
    Reemplazamos el nombre por el nuevo`sudo vim /etc/hostname`
    
    Reemplazamos nuevamente por el nuevo nombre `sudo vim /etc/hosts`
    
    usamos `sudo reboot`
    
    comprobamos los cambios usando `hostname`
    
11. Ver las particiones del SO
    
    `lsblk` "list block devices" (listar dispositivos de bloque):podemos ver las particiones que tiene el disco
    
    Cómo funciona LVM?
    
    Qué es [LVM](https://somebooks.es/que-es-lvm/)  (Administrador de Volúmenes Lógicos) es una tecnología que permite gestionar el almacenamiento en sistemas Linux de manera flexible. Se basa en tres conceptos principales:
    
    1. **Volúmenes físicos (PV)**: Son los discos duros o particiones que se agregan al sistema de LVM.
    2. **Grupos de volúmenes (VG)**: Agrupan uno o más volúmenes físicos y actúan como reservorios de almacenamiento.
    3. **Volúmenes lógicos (LV)**: Son unidades de almacenamiento virtuales creadas dentro de los grupos de volúmenes. Se pueden redimensionar fácilmente.
    
    LVM permite gestionar el espacio de almacenamiento de manera dinámica, facilitando la gestión de particiones y la asignación de espacio sin necesidad de interrumpir el sistema.
    
    - **`dpkg`** es una herramienta de línea de comandos que permite instalar, configurar y gestionar paquetes de software en un sistema Debian. Permite instalar paquetes individuales, mostrar información sobre paquetes instalados, realizar actualizaciones y eliminar paquetes del sistema.
12. Tienes SUDO instalado?
    
    `sudo -V` `dpkg -s sudo`
    
    `which sudo` para ver dónde esta instalado.
    
    ![Screen Shot 2024-03-08 at 3.54.39 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_3.54.39_PM.png)
    
13. Agregamos el nuevo user a sudo
    
    `sudo adduser nameUser sudo`
    
    para comprobarlo `getent group sudo`
    
14. Comprobamos las reglas del subject 
    
    Puedes hacer un ejemplo de fallar la contraseña de sudo para que salte el mensaje personalizado por ejemplo: `sudo uwf status`
    
    usamos cat o vim. Yo lo he llamado sudo_config
    
    `vim /etc/sudoers.d/sudo_config`
    
    - **`passwd_tries=3`**: Limita el número de intentos de contraseña para autenticación.
    - **`badpass_message="Oh, no. Happens & try again!"`**: Define el mensaje mostrado al ingresar una contraseña incorrecta.
    - **`logfile="/var/log/sudo/sudo_config"`**: Especifica la ubicación del archivo de registro de sudo.
    - **`log_input, log_output`**: Registra tanto la entrada como la salida de los comandos ejecutados con sudo.
    - **`iolog_dir="/var/log/sudo"`**: Define el directorio para almacenar registros detallados de entrada/salida.
    - **`requiretty`**: Requiere un terminal asociado para el uso de sudo. Esta línea requiere que un pseudo-terminal (tty) esté asociado con el proceso sudo. Esto es útil para asegurar que sudo solo pueda ser utilizado desde la línea de comandos interactiva y no desde scripts o procesos automatizados.
    - **`secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"`**: Define las rutas seguras para la ejecución de comandos con sudo.
15. El historial del uso del comando sudo
    
    Vamos al lugar con `cd /var/log/sudo` usamos `ls` y luego `cat sudo_config`
    
    ![Screen Shot 2024-03-08 at 4.04.52 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_4.04.52_PM.png)
    
    Usamos un comando con sudo y miramos el fichero
    
    ![Screen Shot 2024-03-08 at 4.06.02 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_4.06.02_PM.png)
    
    al usar el `cat sudo_config`
    
    ![Screen Shot 2024-03-08 at 4.06.30 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_4.06.30_PM.png)
    
16. Comprobamos el UFW y funciona
    
    `dpkg -s ufw`
    
    ![Screen Shot 2024-03-08 at 4.07.57 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_4.07.57_PM.png)
    
    `sudo service ufw status`
    
    ![Screen Shot 2024-03-08 at 4.11.00 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_4.11.00_PM.png)
    
17. Listar las reglas de UFW
    
    `sudo ufw status`
    
    ![Screen Shot 2024-03-08 at 4.11.24 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-08_at_4.11.24_PM.png)
    
    espacio de direccionamiento de Internet IPv4, IPv4 soporta 4,294,967,296 (232)
    
    Pv6 ofrece 3.4 x 1038 (2128) direcciones, un número similar a 6.67126144781401e+23 direcciones IP por cada metro cuadrado sobre la superficie de la Tierra
    
18. Cómo creamos puertos y las eliminamos?
    
    `sudo ufw allow XXXX` para crear el puerto
    
    `sudo ufw status numered`  y luego `sudo ufw delete XXXX` para listar y eliminar el puerto
    
    `sudo ufw status` para ver los puertos
    
19. Comprobar el servicio de ssh esta bien y los puertos que piden
    
    `whinitich ssh`
    
    `sudo service ssh status`
    
20. Sabemos conectarnos por ssh con el nuevo user creado, y que no se pueda con el root
    
    `ssh -p 4242 newUser@tu_ip`
    
21. modificamos el script de 10 a 1
    
    `sudo crontab -u root -e` /1
    
22. Stop script
    
    `sudo /etc/init.d/cron stop`
    
    para volver a ejecutarse
    
    `sudo /etc/init.d/cron start`
    

# CORRECCIÓN

![Screen Shot 2024-03-11 at 12.01.32 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-11_at_12.01.32_PM.png)

![Screen Shot 2024-03-11 at 12.02.18 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-11_at_12.02.18_PM.png)

![Screen Shot 2024-03-11 at 12.02.37 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-11_at_12.02.37_PM.png)

![Screen Shot 2024-03-11 at 12.02.53 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-11_at_12.02.53_PM.png)

![Screen Shot 2024-03-11 at 12.03.06 PM.png](Born2beRoot%2021c033c4ebdf4c74b71f402b29b61b3d/Screen_Shot_2024-03-11_at_12.03.06_PM.png)

# Estado
[![Build Status](https://img.shields.io/static/v1?label=Build%20Status&message=110%20success&color=success)](https://github.com/yowcloud/Born2beRoot)

[https://www.notion.so](https://www.notion.so)
