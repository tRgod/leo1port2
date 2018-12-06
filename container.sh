
lxc-create -n C1 -t download -- -d alpine -r 3.4 -a armhf
lxc-start -n C1
lxc-attach -n C1 -- apk update
lxc-attach -n C1 -- apk add lighttpd php5 php5-cgi php5-curl php5-fpm
lxc-create -n C2 -t download -- -d alpine -r 3.4 -a armhf
lxc-start -n C2
lxc-attach -n C2 -- apk update
lxc-attach -n C2 -- apk add socat
