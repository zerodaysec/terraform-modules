resource "linode_instance" "proxy_host" {
  image           = "linode/ubuntu20.04"
  region          = "us-east"
  type            = "g6-nanode-1"
  authorized_keys = [file("~/.ssh/id_rsa.pub")]
  user_data       = <<-EOF2
#!/bin/bash

apt-get update
apt-get install -y squid3

cat > /etc/squid/squid.conf <<EOF
http_port 3128
acl localnet src 10.0.0.0/8 # RFC1918 possible internal network
acl localnet src 172.16.0.0/12  # RFC1918 possible internal network
acl localnet src 192.168.0.0/16 # RFC1918 possible internal network
acl localnet src fc00::/7       # RFC 4193 local private network range
acl localnet src fe80::/10      # RFC 4291 link-local (directly plugged) machines
acl SSL_ports port 443
acl Safe_ports port 80          # http
acl Safe_ports port 21          # ftp
acl Safe_ports port 443         # https
acl Safe_ports port 70          # gopher
acl Safe_ports port 210         # wais
acl Safe_ports port 1025-65535  # unregistered ports
acl Safe_ports port 280         # http-mgmt
acl Safe_ports port 488         # gss-http
acl Safe_ports port 591         # filemaker
acl Safe_ports port 777         # multiling http
acl CONNECT method CONNECT
http_access allow localnet
http_access allow localhost
http_access deny all
EOF

service squid3 restart
EOF2
}
