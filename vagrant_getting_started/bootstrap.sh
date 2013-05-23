# Custom settings
##############################################################################
export PS1='---\[\033[02;32m\]\u@\H:\[\033[02;36m\]\w\$\[\033[00m\] '
cd /etc/yum.repos.d/
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
cd /usr/local/src/
git clone https://github.com/gsvicky/DevOps.git

# Install & configure Chef-client
##############################################################################
true && curl -L https://www.opscode.com/chef/install.sh | bash
git clone git://github.com/opscode/chef-repo /usr/local/src/DevOps/chef_getting_started/chef-repo
mkdir -p /usr/local/src/DevOps/chef_getting_started/chef-repo/.chef
cp /vagrant/knife.rb /usr/local/src/DevOps/chef_getting_started/chef-repo/.chef
cp /vagrant/adeptize-validator.pem /usr/local/src/DevOps/chef_getting_started/chef-repo/.chef
cp /vagrant/gsvicky.pem /usr/local/src/DevOps/chef_getting_started/chef-repo/.chef

#Add .chef to the .gitignore file to prevent uploading the contents of the .chef folder to github.
##############################################################################
echo '.chef' >> /usr/local/src/DevOps/chef_getting_started/chef-repo/.gitignore

# For convenience, create a link to the src folder in home
##############################################################################
ln -s /usr/local/src/DevOps/chef_getting_started/chef-repo ~/devfolder

# Cleanup
##############################################################################
rm -rf /opt/temp/


