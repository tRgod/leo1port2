echo "lxc.network.type = veth" > /etc/lxc/default.conf
echo "lxc.network.link = lxcbr0">>/etc/lxc/default.conf
echo "lxc.network.flags = up" >> /etc/lxc/default.conf
echo "lxc.network.hwaddr = 00:16:3e:xx:xx:xx" >> /etc/lxc/default.conf
cat /etc/lxc/default.conf
touch /etc/default/lxc-net

echo "USE_LXC_BRIDGE="true"" > /etc/default/lxc-net
cat /etc/default/lxc-net
systemctl restart  lxc-net
systemctl status lxc-net

