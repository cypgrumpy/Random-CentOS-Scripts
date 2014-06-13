#! /bin/bash
# script to configure hostname on server
clear
echo 'Going to change the hostname on this machine, here we go....'
read -p "Please enter your system's main IP: " ip
read -p "hostname: " hostname
echo $ip $hostname > /etc/hosts
hostname $hostname
clear
echo Ok, your hostname has been set to $hostname