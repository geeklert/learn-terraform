#!/bin/bash
dnf install -y
dnf install -y httpd php php-mysqli mariadb105
systemctl start httpd
