# Kill us some udev crap.
##############################################################################
ln -sf /dev/null /lib/udev/rules.d/75-persistent-net-generator.rules
rm -f /etc/udev/rules.d/70-persistent-net.rules

# On startup, remove HWADDR from the eth0 interface.
##############################################################################
cp -f /etc/sysconfig/network-scripts/ifcfg-eth0 /tmp/eth0
sed "/^HWADDR/d" /tmp/eth0 > /etc/sysconfig/network-scripts/ifcfg-eth0
sed -e "s/dhcp/none/;s/eth0/eth1/" /etc/sysconfig/network-scripts/ifcfg-eth0 > /etc/sysconfig/network-scripts/ifcfg-eth1

# Custom settings
##############################################################################
echo "export PS1='\[\033[02;34m\]\u@\H:\[\033[02;37m\]\w\$\[\033[00m\] '" >> ~/.bash_profile
echo "alias ll='ls -al | more'" >> ~/.bash_profile
yum -y install traceroute

# Install & configure Chef-client
##############################################################################
#true && curl -L https://www.opscode.com/chef/install.sh | bash

#mkdir -p /usr/local/src/DevOps/configManagement/chef-repo/.chef
#cp /vagrant/knife.rb /usr/local/src/DevOps/configManagement/chef-repo/.chef
#cp /vagrant/adeptize-validator.pem /usr/local/src/DevOps/configManagement/chef-repo/.chef
#cp /vagrant/gsvicky.pem /usr/local/src/DevOps/configManagement/chef-repo/.chef


