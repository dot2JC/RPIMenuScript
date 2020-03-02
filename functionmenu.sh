#!/bin/bash
shopt -s -o nounset
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

function pause{
  echo "Press ENTER to continue"
  read mmchoice
}

function error{
  echo "Error!"
  echo $errorcode
}

function mainmenu{
  clear
  echo "### Main Menu ###"
  echo "-----------------"
  echo ""
  echo "1) Admin"
  echo "2) Networking"
  echo "3) Security"
  echo ""
  echo "Please enter a number (1-3):"
  read mmchoice
  case "$mmchoice" in
    1)  # Admin Menu
      adminmenu
    ;;
    2) # Networking Menu
      networkmenu
    ;;
    3) # Security Menu
      securitymenu
    ;;
    *)
      echo "Unknown command"
    ;;
  esac
  mainmenu
}

function adminmenu{
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
  echo "b) * GO BACK *"
  echo ""
  echo "Please enter a number (1-7):"
  read amchoice
  case "$amchoice" in
    1) # Backup MBR
      pause
    ;;
    2) # Show log file
      pause
    ;;
    3) # show my config changes
      find / -type f -exec grep -n -A2 '__.2JC__' {} \; -print
      pause
    ;;
    4) # show all config changes
      find / -type f -exec grep -n -A2 '__ALL__' {} \; -print
      pause
    ;;
    5) # Copy CentOS 7 to SD card (RPI)
      pause
    ;;
    6) # Copy CentOS 8 to USB stick
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      mainmenu
    ;;
    *)
      echo "Unknown command"
      pause
    ;;
  esac
  adminmenu
}

function networkmenu{
  clear
  echo "### Networking Menu ###"
  echo "-----------------------"
  echo ""
  echo "1) RSA keys"
  echo "2) TCP/IP"
  echo "3) Remote"
  echo "b) * GO BACK *"
  echo ""
  echo "Please enter a number (1-3):"
  read nmchoice
  case "$nmchoice" in
    1) # RSA keys
      pause
    ;;
    2) # TCP/IP
      pause
    ;;
    3) # Remote
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      mainmenu
    ;;
    *)
      echo "Unknown command"
      pause
    ;;
  esac
  networkmenu
}

function securitymenu{
  clear
  echo "### Security Menu ###"
  echo "---------------------"
  echo ""
  echo "1) tcpdump"
  echo "2) selinux"
  echo "b) * GO BACK *"
  echo ""
  echo "Please enter a number (1-2):"
  read smchoice
  case "$smchoice" in
    1) # tcpdump
      pause
    ;;
    2) # selinux
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      mainmenu
    ;;
    *)
      echo "Unknown command"
      pause
    ;;
  esac
  securitymenu
}

function rsamenu{
  clear
  echo "### RSA Keys Menu ###"
  echo "---------------------"
  echo ""
  echo "1) Create key pair"
  echo "2) Copy public key to remote host"
  echo "b) * GO BACK *"
  echo ""
  echo "Please enter a number (1-2):"
  read rsamchoice
  case "$rsamchoice" in
    1) # Create key pair
      pause
    ;;
    2) # Copy public key to remote host
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      networkmenu
    ;;
    *)
      echo "Unknown command"
      pause
    ;;
  esac
  rsamenu
}

function tcpipmenu{
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
  echo "b) * GO BACK *"
  echo ""
  echo "Please enter a number (1-9):"
  read tcpipmchoice
  case "$tcpipmchoice" in
    1) # Configure as DHCP
      pause
    ;;
    2) # Configure as static
      pause
    ;;
    3) # Edit ethernet settings
      pause
    ;;
    4) # Edit network settings
      pause
    ;;
    5) # Edit resolver settings
      pause
    ;;
    6) # Restart network
      pause
    ;;
    7) # Ping gateway
      pause
    ;;
    8) # Ping DNS
      pause
    ;;
    9) # Ping Google
      clear
      echo "Beginning Ping to 'www.google.com'"
      ping -c 5 www.google.com
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      networkmenu
    ;;
    *)
      echo "Unknown command"
      pause
    ;;
  esac
  tcpipmenu
}

function remotemenu{
  clear
  echo "### Remote Menu ###"
  echo "-------------------"
  echo ""
  echo "1) Select remote"
  echo "2) SSH to remote"
  echo "3) Copy menu to remote"
  echo "4) SSH to remote and execute menu"
  echo "b) * GO BACK *"
  echo ""
  echo "Please enter a number (1-4):"
  read rmchoice
  case "$rmmchoice" in
    1) # Select remote
      pause
    ;;
    2) # SSH to remote
      pause
    ;;
    3) # Copy menu to remote
      pause
    ;;
    4) # SSH to remote and execute menu
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      networkmenu
      ;;
    *)
      echo "Unknown command"
      pause
    ;;
  esac
  remotemenu
}
###############################################################################
#                        REWRITE AS FUNCTIONS FUUUUCK                         #
###############################################################################
  elif [ $nmchoice -eq 3 ] # Remote
  then

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
mainmenu
