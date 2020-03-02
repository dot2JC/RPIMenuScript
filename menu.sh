#!/bin/bash

echo "### Main Menu ###"
echo "-----------------"
echo ""
echo "1) Admin"
echo "2) Networking"
echo "3) Security"
echo ""
echo "Please enter a number (1-3):"
read mmchoice
if [ $mmchoice -eq 1 ] # Admin
then
  clear
  echo "### Admin Menu ###"
  echo "------------------"
  echo ""
  echo "1) Backup MBR"
  echo "2) Show log file"
  echo "3) Show my config changes"
  echo "4) Show all config changes"
  echo "5) Copy CentOS 7 to SD card (RPI)"
  echo "6) Copy CentOS 8 to USB stick"
  echo ""
  echo "Please enter a number (1-6):"
  read amchoice
  if [ $amchoice -eq 1 ] # Backup MBR
  then
    clear
  elif [ $amchoice -eq 2 ] # Show log file
  then
    clear
  elif [ $amchoice -eq 3 ] # Show my config changes
  then
    clear
    find / -type f -exec grep -n -A2 '__.2JC__' {} \; -print
  elif [ $amchoice -eq 4 ] # Show all config changes
  then
    clear
    find / -type f -exec grep -n -A2 '__ALL__' {} \; -print
  elif [ $amchoice -eq 5 ] # Copy Centos7 to SD Card
  then
    clear
  elif [ $amchoice -eq 6 ] # Copy Centos8 to USB
  then
    clear
  else
    echo "ERROR! Try again (Admin Menu)"
  fi
elif [ $mmchoice -eq 2 ] # Networking
then
  clear
  echo "### Networking Menu ###"
  echo "-----------------------"
  echo ""
  echo "1) RSA keys"
  echo "2) TCP/IP"
  echo "3) Remote"
  echo ""
  echo "Please enter a number (1-3):"
  read nmchoice
  if [ $nmchoice -eq 1 ] # RSA keys
  then
    clear
    echo "### RSA Keys Menu ###"
    echo "---------------------"
    echo ""
    echo "1) Create key pair"
    echo "2) Copy public key to remote host"
    echo ""
    echo "Please enter a number (1-2):"
    read rsamchoice
    if [ $rsamchoice -eq 1 ] # Create key pair
    then
      clear
    elif [ $rsamchoice -eq 2 ] # Copy public key to remote host
    then
      clear
    else
        echo "ERROR! Try again. (RSA Keys Menu)"
    fi
  elif [ $nmchoice -eq 2 ] # TCP/IP
  then
    clear
    echo "### TCP/IP Menu ###"
    echo "-------------------"
    echo ""
    echo "1) Configure as DHCP"
    echo "2) Configure as static"
    echo "3) Edit ethernet settings"
    echo "4) Edit network settings"
    echo "5) Edit resolver settings"
    echo "6) Restart network"
    echo "7) Ping gateway"
    echo "8) Ping DNS"
    echo "9) Ping google"
    echo ""
    echo "Please enter a number (1-9):"
    read tcpipmchoice
    if [ $tcpipmchoice -eq 1 ] # Configure as DHCP
    then
      clear
    elif [ $tcpipmchoice -eq 2 ] # Configure as static
    then
      clear
    elif [ $tcpipmchoice -eq 3 ] # Edit ethernet settings
    then
      clear
    elif [ $tcpipmchoice -eq 4 ] # Edit network settings
    then
      clear
    elif [ $tcpipmchoice -eq 5 ] # Edit resolver settings
    then
      clear
    elif [ $tcpipmchoice -eq 6 ] # Restart network
    then
      clear
    elif [ $tcpipmchoice -eq 7 ] # Ping gateway
    then
      clear
    elif [ $tcpipmchoice -eq 8 ] # Ping DNS
    then
      clear
    elif [ $tcpipmchoice -eq 9 ] # Ping google
    then
      clear
    else
      echo "ERROR! Try again. (TCP/IP Menu)"
    fi
  elif [ $nmchoice -eq 3 ] # Remote
  then
    clear
    echo "### Remote Menu ###"
    echo "-------------------"
    echo ""
    echo "1) Select remote"
    echo "2) SSH to remote"
    echo "3) Copy menu to remote"
    echo "4) SSH to remote and execute menu"
    echo ""
    echo "Please enter a number (1-4):"
    read rmchoice
    if [ $rmchoice -eq 1 ] # Select remote
    then
      clear
    elif [ $rmchoice -eq 2 ] # SSH to remote
    then
      clear
    elif [ $rmchoice -eq 3 ] # Copy menu to remote
    then
      clear
    elif [ $rmchoice -eq 4 ] # SSH to remote and execute menu
    then
      clear
    else
      echo "ERROR! Try again. (Remote Menu)"
    fi
  else
    echo "ERROR! Try again. (Network Menu)"
  fi
elif [ $mmchoice -eq 3 ] # Security
then
  clear
  echo "### Security Menu ###"
  echo "---------------------"
  echo ""
  echo "1) tcpdump"
  echo "2) selinux"
  echo ""
  echo "Please enter a number (1-2):"
  read smchoice
  if [ $smchoice -eq 1 ] # tcpdump
  then
    clear
    echo "### TCPDump Menu ###"
    echo "--------------------"
    echo ""
    echo "1) Start tcpdump on remote in the background (tmux)"
    echo "2) Copy dump file from remote"
    echo "3) Select dump file"
    echo "4) Show all arp"
    echo "5) Show all icmp"
    echo "6) Show all tcp"
    echo "7) Show all udp"
    echo "8) Show only icmp echo request and reply"
    echo ""
    echo "Please enter a number (1-8):"
    read tcpdmchoice
    if [ $tcpdmchoice -eq 1 ] # Start tcpdump on remote in the background
    then
      clear
    elif [ $tcpdmchoice -eq 2 ] # Copy dump file from remote
    then
      clear
    elif [ $tcpdmchoice -eq 3 ] # Select dump file
    then
      clear
    elif [ $tcpdmchoice -eq 4 ] # Show all arp
    then
      clear
    elif [ $tcpdmchoice -eq 5 ] # Show all icmp
    then
      clear
    elif [ $tcpdmchoice -eq 6 ] # Show all tcp
    then
      clear
    elif [ $tcpdmchoice -eq 7 ] # Show all udp
    then
      clear
    elif [ $tcpdmchoice -eq 8 ] # Show only icmp echo request and reply
    then
      clear
    else
      echo "ERROR! Try again. (TCP Dump Menu)"
    fi
  elif [ $smchoice -eq 2 ] # selinux
  then
    clear
  else
    echo "ERROR! Try again. (Security Menu)"
  fi
else
	echo "ERROR! Try Again. (Main Menu)"
fi
