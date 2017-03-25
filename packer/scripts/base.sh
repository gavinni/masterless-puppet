#!/bin/bash -eux

mkdir -p /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
echo 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDg5hH4OY5joKS1yX5eVqVPdMNKTCr1CQCxPxCU9Le0eP7PZbabAs3/8+z60cdfo1jFWmpC+JnUDzJpK6yOicNSPWvSGzZEWtIXFYpoD+va0DJBgknUUkO119t+PROvtb4BvERQm8z57G8bHHiQC7j0o6JLUgPNjBa2C5r88cnei7729lGWlNc6pwOqg6NWKhpWAcVLk8J/FLr51QjNRvDpYJZIh6Zscs2H2+kP4rQIb7F3AwAwrxWnVypDYpE91SWmmFDFhPP4dHIK9kxn3BNpNmr0/WnpVy6h62BnOzCkIX6rws5uejTc3FUKD45FEAtDYnDA4FcyGRrUmpzpewqp gni@MacBook-Pro-5.local' > /home/vagrant/.ssh/authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant: /home/vagrant/.ssh
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.ori
sed -i -e '/#UseDNS yes/a UseDNS no' /etc/ssh/sshd_config

rpm -i http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm

rpm -i https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm

yum update

## Install Ruby environment
#yum install -y git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel
#yum install -y ruby rubygems
#gem install bundler
#gem install puppet
