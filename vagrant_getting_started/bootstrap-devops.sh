# Custom settings
##############################################################################
echo "export PS1='\[\033[02;32m\]\u@\H:\[\033[02;36m\]\w\$\[\033[00m\] '" >> ~/.bash_profile
echo "alias ll='ls -al | more'" >> ~/.bash_profile
cd /etc/yum.repos.d/
yum -y install traceroute
mkdir /opt/temp/

# Install Virtualbox
##############################################################################
wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
yum -y install VirtualBox-4.2

# Install Vagrant
##############################################################################
cd /opt/temp/
wget http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/vagrant_1.2.2_x86_64.rpm
rpm -Uvhe  vagrant_1.2.2_x86_64.rpm

# Install Git & pull code
##############################################################################
yum -y install git
rpm -i 'http://packages.sw.be/rpmforge-release/rpmforge-release-0.5.2-2.el6.rf.x86_64.rpm'
rpm --import http://apt.sw.be/RPM-GPG-KEY.dag.txt
sed -i 's/enabled = 0/enabled = 1/g' /etc/yum.repos.d/rpmforge.repo
yum -y update git
sed -i 's/enabled = 1/enabled = 0/g' /etc/yum.repos.d/rpmforge.repo
yum clean all

git config --global user.name "Victor Gajendran"
git config --global user.email "gsvicky@gmail.com"

cd /usr/local/src/
git clone https://github.com/gsvicky/DevOps.git

# Install & configure Chef-client
##############################################################################
true && curl -L https://www.opscode.com/chef/install.sh | bash

mkdir -p /usr/local/src/DevOps/configManagement/chef-repo/.chef
cp /vagrant/knife.rb /usr/local/src/DevOps/configManagement/chef-repo/.chef
cp /vagrant/adeptize-validator.pem /usr/local/src/DevOps/configManagement/chef-repo/.chef
cp /vagrant/gsvicky.pem /usr/local/src/DevOps/configManagement/chef-repo/.chef

# For convenience, create a link to the src folder in home
##############################################################################
ln -s /usr/local/src/DevOps/configManagement/chef-repo ~/chefdir

# Cleanup
##############################################################################
rm -rf /opt/temp/

##############################################################################
# WHEN VM IS SETUP GIT SSH KEY https://help.github.com/articles/generating-ssh-keys
#### ssh-keygen -t rsa -C "gsvicky@gmail.com"
#### [Enter], pass1!
#### cp  -f ~/.ssh/id_rsa.pub /vagrant/ 
#### Add key in Github.com
#### ssh -T git@github.com
##############################################################################
