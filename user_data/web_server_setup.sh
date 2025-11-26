#!/bin/bash
yum update -y
yum install -y httpd
systemctl enable httpd
systemctl start httpd
INSTANCE_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
echo "<html><body><h1>Web Server Running</h1><p>Instance ID: $INSTANCE_ID</p></body></html>" > /var/www/html/index.html
systemctl restart httpd