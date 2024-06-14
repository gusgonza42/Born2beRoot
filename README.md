<div align="center">
    <h1>Born2beRoot</h1>
    <img src="https://raw.githubusercontent.com/gusgonza42/my-utils-gusgonza/main/ft_badges_42/badge_01_born2beroot_500px.png" style="width: 150px; height: 150px;">
<div>Estado</div>

[![Build Status](https://img.shields.io/static/v1?label=Build%20Status&message=110%20success&color=success)](https://github.com/yowcloud/Born2beRoot)
</div>

- - -

## 💡 Acerca del Proyecto

> _El objetivo de este proyecto es configurar y asegurar un servidor basado en Linux, proporcionando una introducción a la administración de sistemas y la seguridad informática._

Este proyecto te permitirá aprender a instalar, configurar y asegurar un servidor desde cero, enfocándose en habilidades críticas para la administración de sistemas.

Para obtener información más detallada, consulta el [**Subject**](https://github.com/gusgonza42/Born2beRoot/blob/main/born2beroot_es.subject.pdf).

## 🛠️ Requisitos

### Software

- **Sistema Operativo**: Debian la version  LTS en ese momento.
- **Virtualización**: VirtualBox o VMware (el que este diponible en el campus)

### Conocimientos

- Familiaridad con la línea de comandos de Linux
- Conocimientos básicos de redes y seguridad
- Entender la configuración y uso de servicios y daemons en Linux

## 📋 Instrucciones

### 1. Preparación del Entorno

Para este proyecto, he preparado una guía paso a paso que cubre la configuración completa de la máquina virtual, incluyendo la creación manual de particiones (parte del bonus) y todos los pasos del obligatorio.

## Guía Paso a Paso

- **Guía completa:** [Guía Paso a Paso](https://github.com/gusgonza42/Born2beRoot/blob/main/born2beroot-guide/README.md)



### 2. Configuración básica

1. **Actualización del Sistema**:
   ```shell
   sudo apt update && sudo apt upgrade -y
   ```

2. **Configuración de SSH**:
   - Edita el archivo de configuración de SSH:
     ```shell
     sudo nano /etc/ssh/sshd_config
     ```
   - Reinicia el servicio SSH:
     ```shell
     sudo systemctl restart ssh
     ```

3. **Firewall con UFW**:
   - Instalación y configuración de UFW:
     ```shell
     sudo apt install ufw
     sudo ufw enable
     ```


### 3. Configuración del Bonus (Solo la parte de particiones)

### Verificación de Particiones

1. **Comprobar Particiones**:
   - Verifica las particiones configuradas:
     ```shell
     lsblk
     ```
   - Verifica el uso de la partición swap:
     ```shell
     swapon --show
     ```


## 📋 Pruebas

### Verificación de Configuraciones

- Tienes todo lo necesario en la  parte final de la guía.
