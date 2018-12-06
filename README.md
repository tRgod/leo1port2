# leo1port2
Soulution to the second assigment by Magil16 and Throe16
It is required to run the scripts from root for the solution to work. 
The script setup.sh creates the default container configuration file for unprivileged container 
according to the guidelines at https://help.ubuntu.com/lts/serverguide/lxc.html

The script bridgesetup.sh configures the network bridge.

The containers C1 and C2 are set to have static IPs using the staticdhcp.sh which creates the file /etc/lxc/dhcp.conf containing the following lines:
dhcp-host=C1,10.0.3.11
dhcp-host=C2,10.0.3.12
and adds the following line to /etc/default/lxc-net in order to allow for static IPs:
LXC_DHCP_CONFILE=/etc/lxc/dhcp.conf

The script container.sh creates and starts containers C1 and C2.

C1 has lighttpd installed and handles the web-server.
C1's container port is connected to port 80 using the following command:
iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to-destination 10.0.3.11:80

C2 has the random number script rng.sh.
On C2 in order to allow for the random numbers to be fetched this command was used:
socat -v -v tcp-listen:80,fork,reuseaddr exec:/bin/rng.sh
