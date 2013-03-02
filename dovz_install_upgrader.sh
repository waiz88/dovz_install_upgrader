#!/bin/sh

# -----------Sources.list section starts 

# create a new /etc/apt/sources.list
# My mirror is Swedish
# echo "deb http://ftp.se.debian.org/debian stable main contrib non-free"
# deb-src http://ftp.se.debian.org/debian stable main contrib non-free

# deb http://ftp.debian.org/debian/ squeeze-updates main contrib non-free
# deb-src http://ftp.debian.org/debian/ squeeze-updates main contrib non-free

# deb http://security.debian.org/ squeeze/updates main contrib non-free
# deb-src http://security.debian.org/ squeeze/updates main contrib non-free

echo "Fetching sources.list from github"
wget -O /tmp/sources.list https://raw.github.com/sillkongen/dovz_install_upgrader/master/sources.list

echo "moving old sources.list to /tmp as old.sources.list"

mv /etc/apt/sources.list /tmp/old.sources.list

cp /tmp/sources.list /etc/apt/sources.list

# -----------Sources.list section ends

# -----------Update section starts

/usr/bin/apt-get -y update
/usr/bin/apt-get -y upgrade

/usr/bin/apt-get install -y linux-image-openvz-AMD64 vzctl vzquota vzdump ksplice nmap harden-servers ifenslave-2.6

ln -s /var/lib/vz /vz

# Install Ovz-web-panel from Google Code.
echo "wget -O - http://ovz-web-panel.googlecode.com/svn/installer/ai.sh | sh" > webui.sh

wget -O /tmp/sysctl.conf https://raw.github.com/sillkongen/dovz_install_upgrader/master/sysctl.conf
echo "Over writing /etc/sysctl.conf"
cp /tmp/sysctl.conf /etc/sysctl.conf

wget -O /tmp/vz.conf https://raw.github.com/sillkongen/dovz_install_upgrader/master/vz.conf
echo "Over writing /etc/vz/vz.conf"
cp /tmp/vz.conf /etc/vz/vz.conf

echo "Patching of Debian 6 installation is finished + removal of nfs + portmap daemon. Installation of OpenVZ + nmap + harden-server + ksplice + ifenslave (bonding)"
echo "Reboot your system now and run webui.sh script after the reboot to install the OpenVZ web interface."





