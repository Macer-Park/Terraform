#!/bin/bash
(
echo "qwe123"
echo "qwe123"
) | passwd --stdin ec2-user
sed -i "s/^PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
service sshd restart