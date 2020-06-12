[toc]

# Config Linux


## IP Fixe

Changer l'IP: :1234: 

```vim
TYPE=Ethernet
BOOTPROTO=static
IPADDR=10.4.1.6
NETMASK=255.255.255.0
NAME=enp0s8
DEVICE=enp0s8
ONBOOT=yes
```

redemarrer le service
```bash
[user@guesswho ~]$ systemctl restart network.service
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to manage system services or units.
Authenticating as: user
Password:
==== AUTHENTICATION COMPLETE ===

[user@guesswho ~]$ ip a
[...]
3: enp0s8: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast state UP group default qlen 1000
    link/ether 08:00:27:62:95:e1 brd ff:ff:ff:ff:ff:ff
    inet 10.4.1.6/24 brd 10.4.1.255 scope global noprefixroute enp0s8
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fe62:95e1/64 scope link
       valid_lft forever preferred_lft forever
```

## Utilisateur

```bash
[user@mail ~]$ sudo useradd sadone
[user@mail ~]$ sudo groupadd tp1
[sudo] password for user:***

[user@mail ~]$ sudo usermod -a -G tp1 sadone


[user@mail ~]$ sudo visudo

    ## Same thing without a password
    %tp1    ALL=(ALL)       NOPASSWD: ALL
```

Changement de MDP:

```shell
[root@mail ~]# passwd sadone
Changing password for user sadone.
New password:
```

## Renomez la VM

```bash
[user@mail ~]$ hostnamectl set-hostname samuel.adone.local


[user@mail ~]# cat /etc/hosts

127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4 samuel.adone.localdomain
```

## SSH:

enfaite depuis le debut je suis en SSH heheheh

![](https://i.imgur.com/Xfkeka3.png)

```vim
#       $OpenBSD: sshd_config,v 1.100 2016/08/15 12:32:04 naddy Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.
PermitRootLogin=No
```

## Date :D

```bash

[sadone@mail ~]$ sudo yum install ntp
Loaded plugins: fastestmirror
Determining fastest mirrors
epel/x86_64/metalink                         |  29 kB  00:00:00

...
...
...
Installed:
  ntp.x86_64 0:4.2.6p5-29.el7.centos

Dependency Installed:
  autogen-libopts.x86_64 0:5.18-5.el7                                                     ntpdate.x86_64 0:4.2.6p5-29.el7.centos

Complete!


[sadone@mail ~]$ systemctl enable ntpd
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-unit-files ===
Authentication is required to manage system service or unit files.
Authenticating as: user
Password:
==== AUTHENTICATION COMPLETE ===
Created symlink from /etc/systemd/system/multi-user.target.wants/ntpd.service to /usr/lib/systemd/system/ntpd.service.
==== AUTHENTICATING FOR org.freedesktop.systemd1.reload-daemon ===
Authentication is required to reload the systemd state.
Authenticating as: user
Password:
==== AUTHENTICATION COMPLETE ===

[sadone@mail ~]$ systemctl start ntpd
==== AUTHENTICATING FOR org.freedesktop.systemd1.manage-units ===
Authentication is required to manage system services or units.
Authenticating as: user
Password:
==== AUTHENTICATION COMPLETE ===
```
