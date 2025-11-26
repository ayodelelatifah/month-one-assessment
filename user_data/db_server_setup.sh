#!/bin/bash
yum update -y
amazon-linux-extras enable postgresql14
yum install -y postgresql postgresql-server
/usr/bin/postgresql-setup initdb
systemctl enable postgresql
systemctl start postgresql
