#!/bin/bash

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
