# Custom settings
##############################################################################
echo "export PS1='\[\033[02;32m\]\u@\H:\[\033[02;36m\]\w\$\[\033[00m\] '" >> ~/.bash_profile
function lll { ls -al $1 | more; }
cd /etc/yum.repos.d/
yum -y install traceroute
mkdir /opt/temp/

# cleanup unnecesary rpm
##############################################################################
yum -y erase chef
yum -y erase facter

# Install Virtualbox
##############################################################################
#wget http://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
#yum -y install VirtualBox-4.2

# Install Vagrant
##############################################################################
#cd /opt/temp/
#wget http://files.vagrantup.com/packages/7e400d00a3c5a0fdf2809c8b5001a035415a607b/vagrant_1.2.2_x86_64.rpm
#rpm -Uvhe  vagrant_1.2.2_x86_64.rpm

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

# Install & configure knife, chef-solo and Chef-client
##############################################################################
true && curl -L https://www.opscode.com/chef/install.sh | bash
mkdir -p ~/.chef/
cp /vagrant/knife.rb ~/.chef/
mkdir -p /etc/chef/
cp /vagrant/solo.rb /etc/chef/
cp /vagrant/knifeuser.pem /etc/chef/client.pem
cp /vagrant/adeptize-validator.pem /etc/chef/

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
#### knife environment from file /vagrant/temp/dev-environment.json
#### knife role from file /vagrant/temp/base.rb
#### knife role from file /vagrant/temp/webserver.rb
#### knife role from file /vagrant/temp/db-master.rb
#### knife cookbook site install cron
#### knife cookbook site install chef-client
#### knife cookbook site install apache2
#### knife cookbook site install build-essential
#### knife cookbook site install dmg
#### knife cookbook site install yum
#### knife cookbook site install chef_handler
#### knife cookbook site install windows
#### knife cookbook site install runit
#### knife cookbook site install git
#### knife cookbook site install logrotate
#### knife cookbook site install openssl
#### knife cookbook site install mysql
#### knife cookbook site install ntp
#### knife cookbook site install sudo

#### knife cookbook upload cron
#### knife cookbook upload chef-client
#### knife cookbook upload apache2
#### knife cookbook upload build-essential
#### knife cookbook upload dmg
#### knife cookbook upload yum
#### knife cookbook upload chef_handler
#### knife cookbook upload windows
#### knife cookbook upload runit
#### knife cookbook upload git
#### knife cookbook upload logrotate
#### knife cookbook upload openssl
#### knife cookbook upload mysql
#### knife cookbook upload ntp
#### knife cookbook upload sudo
##############################################################################
