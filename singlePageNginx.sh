#!/bin/bash
set -e

# Create self signed cert for HTTPS reverse proxy as Nginx
# Possibly change it to letsEncrypt bot
openssl genrsa -out /tmp/app.key 2048
openssl req -new -key /tmp/app.key -out /tmp/app.csr -subj "/C=CA/ST=ON/L=Toronto/O=Digital/OU=IT/CN=iaclab.com"
openssl x509 -req -days 365 -in /tmp/app.csr -signkey /tmp/app.key -out /tmp/app.crt
chmod 644 /tmp/app.crt /tmp/app.key
echo "self signed cert done" >> /tmp/debug.log

# Install and configure nginx for HTTPS
sudo amazon-linux-extras enable nginx1
sudo yum -y install nginx
sudo yum -y install amazon-cloudwatch-agent
mkdir -p /etc/nginx/ssl
mv -f /tmp/app.key /etc/nginx/ssl/app.key
mv -f /tmp/app.crt /etc/nginx/ssl/app.crt
chmod 755 /etc/nginx/ssl
chmod -R 644 /etc/nginx/ssl/*
mv -f /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak

######################
# STATIC WEB PAGE
######################
mkdir -p /etc/nginx/www
cat > /etc/nginx/www/index.html <<'EOF'
<h1> Hello There</h1>
  <p>
    This webpage is part of a lab and is served through nginx
  </p>
EOF
chmod 0755  /etc/nginx/www
chmod 644 /etc/nginx/www/index.html
echo "index webpage created "  >> /tmp/debug.log


# set conf in nginx
cat > /etc/nginx/nginx.conf <<'EOF'
user nginx;
worker_processes auto;
error_log /var/log/nginx/error.log;
pid /run/nginx.pid;

# Load dynamic modules. See /usr/share/doc/nginx/README.dynamic.
include /usr/share/nginx/modules/*.conf;
events {
    worker_connections 1024;
}

http {
  log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
  '$status $body_bytes_sent "$http_referer" '
  '"$http_user_agent" "$http_x_forwarded_for"';
  access_log  /var/log/nginx/access.log  main;
  sendfile            on;
  tcp_nopush          on;
  tcp_nodelay         on;
  keepalive_timeout   65;
  types_hash_max_size 2048;
  include /etc/nginx/mime.types;
  default_type        application/octet-stream;
  include /etc/nginx/conf.d/*.conf;
}
EOF


# set app conf in nginx
cat > /etc/nginx/conf.d/app.conf <<'EOF'
server {
    listen 443 ssl;
    server_name localhost;
    root /etc/nginx/www;
    error_log /var/log/nginx/app-server-error.log notice;
    index demo-index.html index.html;
    expires -1;

    ssl_certificate           /etc/nginx/ssl/app.crt;
    ssl_certificate_key       /etc/nginx/ssl/app.key;

    ssl_session_cache  builtin:1000  shared:SSL:10m;
    ssl_protocols  TLSv1 TLSv1.1 TLSv1.2;
    ssl_ciphers HIGH:!aNULL:!eNULL:!EXPORT:!CAMELLIA:!DES:!MD5:!PSK:!RC4;
    ssl_prefer_server_ciphers on;

    access_log  /var/log/nginx/app.access.log;

    sub_filter_once off;
    sub_filter 'server_hostname' '$hostname';
    sub_filter 'server_address'  '$server_addr:$server_port';
    sub_filter 'server_url'      '$request_uri';
    sub_filter 'remote_addr'     '$remote_addr:$remote_port';
    sub_filter 'server_date'     '$time_local';
    sub_filter 'client_browser'  '$http_user_agent';
    sub_filter 'request_id'      '$request_id';
    sub_filter 'nginx_version'   '$nginx_version';
    sub_filter 'document_root'   '$document_root';
    sub_filter 'proxied_for_ip'  '$http_x_forwarded_for';

    location / {
      index index.html;
    }
}
EOF
chmod -R 644  /etc/nginx/ssl/* /etc/nginx/nginx.conf /etc/nginx/conf.d/app.conf
echo "nginx installation done" >> /tmp/debug.log


sudo yum -y install firewalld
systemctl unmask firewalld
systemctl restart firewalld
firewall-cmd --zone=public --permanent --add-service=http
firewall-cmd --zone=public --permanent --add-service=https
firewall-cmd --reload
systemctl enable firewalld
systemctl restart firewalld


# Start and enable on boot, nginx as a service
systemctl enable nginx
systemctl restart nginx
echo "nginx start done" >> /tmp/debug.log