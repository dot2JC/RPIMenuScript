#!/bin/bash
shopt -s -o nounset
lastmenu=""
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"

function pause {
  read -p "Press ENTER to continue... " choice
  lastmenu
}

function error {
  echo -e "### Error, $choice is an unknown input.  ###\n"
  pause
}

function lastmenu {
  if [ $lastmenu = 'adminmenu' ]; then
    adminmenu
  elif [ $lastmenu = 'networkmenu' ]; then
    networkmenu
  elif [ $lastmenu = 'securitymenu' ]; then
    securitymenu
  elif [ $lastmenu = 'configchangesmenu' ]; then
    configchangesmenu
  elif [ $lastmenu = 'rsamenu' ]; then
    rsamenu
  elif [ $lastmenu = 'tcpipmenu' ]; then
    tcpipmenu
  elif [ $lastmenu = 'remotemenu' ]; then
    remotemenu
  elif [ $lastmenu = 'tcpdumpmenu' ]; then
    tcpdumpmenu
  else
    mainmenu
  fi
  lastmenu
}

function mainmenu {
  clear
  lastmenu='mainmenu'
  echo "### Main Menu ###"
  echo "-----------------"
  echo "1) Admin"
  echo "2) Networking"
  echo -e "3) Security\n"
  read -p "Please enter a number (1-3): " mmchoice
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
    q)
      exit
    ;;
    *)
      error
    ;;
  esac
  mainmenu
}

function adminmenu {
  clear
  lastmenu='adminmenu'
  echo "### Admin Menu ###"
  echo "------------------"
  echo "1) Backup MBR"
  echo "2) Show log file"
  echo "3) Show config changes menu"
  echo "3) Copy CentOS 7 to SD card (RPI)"
  echo "4) Copy CentOS 8 to USB stick"
  echo -e "b) * GO BACK *\n"
  read -p  "Please enter a number (1-7): " amchoice
  case "$amchoice" in
    1) # Backup MBR
      pause
    ;;
    2) # Show log file
      pause
    ;;
    3) # Show config changes menu
      configchangesmenu
    ;;
    4) # Copy CentOS 7 to SD card (RPI)
      pause
    ;;
    5) # Copy CentOS 8 to USB stick
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      mainmenu
    ;;
    *)
      error
    ;;
  esac
  adminmenu
}

function networkmenu {
  clear
  lastmenu='networkmenu'
  echo "### Networking Menu ###"
  echo "-----------------------"
  echo "1) RSA keys"
  echo "2) TCP/IP"
  echo "3) Remote"
  echo -e "b) * GO BACK *\n"
  read -p "Please enter a number (1-3): " nmchoice
  case "$nmchoice" in
    1) # RSA keys
      rsamenu
    ;;
    2) # TCP/IP
      tcpipmenu
    ;;
    3) # Remote
      remotemenu
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      mainmenu
    ;;
    *)
      error
    ;;
  esac
  networkmenu
}

function securitymenu {
  clear
  lastmenu='securitymenu'
  echo "### Security Menu ###"
  echo "---------------------"
  echo "1) tcpdump"
  echo "2) selinux"
  echo -e "b) * GO BACK *\n"
  read -p "Please enter a number (1-2): " smchoice
  case "$smchoice" in
    1) # tcpdump
      tcpdumpmenu
    ;;
    2) # selinux
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      mainmenu
    ;;
    *)
      error
    ;;
  esac
  securitymenu
}

function configchangesmenu {
  clear
  lastmenu='configchangesmenu'
  echo "### Menu Configuration Changes ###"
  echo "----------------------------------"
  echo "1) Show my configuration changes"
  echo "2) Show all configuration changes"
  echo "3) Show other configuration changes"
  echo "4) Backup all configuration changes"
  echo "5) Show all configuration changes since last backup"
  echo -e "b) * GO BACK *\n"
  read -p "Please enter a number (1-5): " configchangesmchoice
  case "$configchangesmchoice" in
    1) # show my config changes
      clear
      echo "Checking for configuration changes by: '__.2JC__'"
      find / -type f -exec grep -n -A2 '__.2JC__' {} \; -print 2> /dev/null
      pause
    ;;
    2) # show all config changes
      find / -type f -exec grep -n -A2 '__ALL__' {} \; -print 2> /dev/null
      pause
    ;;
    3) # show other config changes

      pause
    ;;
    4) # backup all config changes

      pause
    ;;
    5) # show all config changes since last backup

      pause
    ;;
    b)
      adminmenu
    ;;
    *)
      error
    ;;
  esac
  configchangesmenu
}
function rsamenu {
  clear
  lastmenu='rsamenu'
  echo "### RSA Keys Menu ###"
  echo "---------------------"
  echo "1) Create key pair"
  echo "2) Copy public key to remote host"
  echo -e "b) * GO BACK *\n"
  read -p "Please enter a number (1-2): " rsamchoice
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

function tcpipmenu {
  clear
  lastmenu='tcpipmenu'
  echo "### TCP/IP Menu ###"
  echo "-------------------"
  echo "1) Configure as DHCP"
  echo "2) Configure as static"
  echo "3) Edit ethernet settings"
  echo "4) Edit network settings"
  echo "5) Edit resolver settings"
  echo "6) Restart network"
  echo "7) Ping gateway"
  echo "8) Ping DNS"
  echo "9) Ping google"
  echo -e "b) * GO BACK *\n"
  read -p "Please enter a number (1-9): " tcpipmchoice
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
      clear
      version=$(lsb_release -a | grep 'Release:')
      if [ $version:9:1 == '8' ]; then
        restart NetworkManager.service
      elif [ $version:9:1 == '7' ]; then # CentOS 7
        systemctl restart network.service
      elif [ $version:9:1 == '6' ]; then # CentOS 6
        service network restart
      else
        echo "You're not running CentOS, you silly goose!"
      fi
      pause
    ;;
    7) # Ping gateway
      clear
      gateway=$(ip route show default | awk '/default/ {print $3}')
      echo -e "Beginning Ping to Gateway... \n"
      ping -c 5 $gateway
      pause
    ;;
    8) # Ping DNS
      clear
      dns=$(cat /etc/resolv.conf | grep 'nameserver')
      echo -e "Beginning Ping to DNS... \n"
      ping -c 5 $dns
      pause
    ;;
    9) # Ping Google
      clear
      echo -e "Beginning Ping to 'google.com'... \n"
      ping -c 5 google.com
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      networkmenu
    ;;
    *)
      error
    ;;
  esac
  tcpipmenu
}

function remotemenu {
  clear
  lastmenu='remotemenu'
  echo "### Remote Menu ###"
  echo "-------------------"
  echo "1) Select remote"
  echo "2) SSH to remote"
  echo "3) Copy menu to remote"
  echo "4) SSH to remote and execute menu"
  echo -e "b) * GO BACK *\n"
  read -p "Please enter a number (1-4): " rmchoice
  case "$rmchoice" in
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
      error
    ;;
  esac
  remotemenu
}

function tcpdumpmenu {
  clear
  lastmenu='tcpdumpmenu'
  echo "### TCPDump Menu ###"
  echo "--------------------"
  echo "1) Start tcpdump on remote in the background (tmux)"
  echo "2) Copy dump file from remote"
  echo "3) Select dump file"
  echo "4) Show all arp"
  echo "5) Show all icmp"
  echo "6) Show all tcp"
  echo "7) Show all udp"
  echo "8) Show only icmp echo request and reply"
  echo -e "b) * GO BACK *\n"
  read -p "Please enter a number (1-8): " tcpdumpmchoice
  case "$tcpdumpmchoice" in
    1) # Start tcpdump on remote in the background (tmux)
      pause
    ;;
    2) # Copy dump file from remote
      pause
    ;;
    3) # Select dump file
      pause
    ;;
    4) # Show all arp
      pause
    ;;
    5) # Show all icmp
      pause
    ;;
    6) # Show all tcp
      pause
    ;;
    7) # Show all udp
      pause
    ;;
    8) # Show only icmp echo request and reply
      pause
    ;;
    b) # WHAT WE DO HERE IS GO BACK BACK BACK
      securitymenu
    ;;
    *)
      error
    ;;
  esac
  tcpdumpmenu
}

mainmenu
