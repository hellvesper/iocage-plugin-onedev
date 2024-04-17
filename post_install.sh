#!/bin/tcsh


echo "install onedev"

ln -s /usr/local/bin/java* /usr/bin/

echo "Fetch and install OneDev"
cd /root && fetch https://github.com/hellvesper/iocage-plugin-onedev/onedev.tar.gz && \
tar -xf onedev.tar.gz && \
/root/onedev/bin/server.sh install

# Define the username and other details
# set username="onedev"
# set fullname="onedev"
# set uid=1001
# set gid=1001
# set home="/home/onedev"
# set shell="/bin/bash"

# Create group
# /usr/sbin/pw groupadd ${username}

# Create the user
# /usr/sbin/pw useradd ${username} -n ${fullname} -u ${uid} -g ${gid} -m -s ${shell}

# Set a password for the new user
#echo "newuser:password" | /usr/sbin/chpass

# Optionally, add the user to a group
#/usr/sbin/pw groupmod staff -m ${username}

# cp /root/onedev /home/onedev/
# chown onedev:onedev /home/onedev

# echo "Enable nginx service"
sysrc -f /etc/rc.conf nginx_enable=YES
service nginx start
sysrc -f /etc/rc.conf mdnsresponderposix_enable=YES
sysrc -f /etc/rc.conf mdnsresponderposix_flags="-f /usr/local/etc/mdnsresponder.conf"
service mdnsresponderposix start
sysrc -f /etc/rc.conf onedev_enable=YES
service onedev start

echo "There is no default username and password, register new user with your credentials." >> /root/PLUGIN_INFO
