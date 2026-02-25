#!/bin/bash

echo "Restaurando configuracion de red DHCP para enp0s7..."

sudo bash -c 'cat > /etc/netplan/50-cloud-init.yaml <<EOF
network:
  version: 2
  ethernets:
    enp0s7:
      dhcp4: true
EOF'

echo "Aplicando configuracion..."
sudo netplan apply

echo "Mostrando estado de la interfaz..."
ip a show enp0s7

echo "Proceso finalizado."