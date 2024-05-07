#!/bin/bash

HOSTNAME=srv2
DDNSUSER=
DDNSPASS=

apt-get -y autoremove
apt-get install -y ddclient openssh-server

echo "protocol=googledomains
use=web, web=https://domains.google.com/checkip
login='$DDNSUSER'
password='$DDNSPASS'
$HOSTNAME.danielrothfus.com" > /etc/ddclient.conf

echo "ChallengeResponseAuthentication no
PasswordAuthentication no
UsePAM no
PermitRootLogin no" > /etc/ssh/sshd_config.d/harden.conf

mkdir -p ~danielrothfus/.ssh
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDC+R/obroEpCTz4sL4piQ4z0fJF6udKKyqFydV/y05nALkwwtuR45zs/ICn2axAz7yMFcztn+QQEa5VwmM08RHBB4NyE+BGDroZ42KVxuOF8UhvvkOAoJQxwEWqH5v1vC7j0eDW8wayk/Df01sX0eSR2vvTGe7kESKOwCbC5dGfrw65P2vrg9VMJzvfqfRwNqwQ6oLyTQcW2H/O0L0N/DAn1rhUUH+REQ4k9uBSrpdyA4sR2T6akSrYP8pY9fJ7kVvHX38dRzOaD9CIFxo36XCGLuc3jDmNsvmMHjpYX20JTQoOWseK4DoQFYbeQ9U9vF1r6argKM4NnGN5W5J4MSv danielrothfus@DESKTOP-CMO037G" > ~danielrothfus/.ssh/authorized_keys

service sshd restart
service ddclient restart
