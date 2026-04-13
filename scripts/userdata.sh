#!/bin/bash
echo "Hello World" > ~/practica_6/hello_world.txt

yum update -y
yum install -y httpd 
systemctl enable httpd
systemctl start httpd
