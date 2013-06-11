# Custom settings
##############################################################################
#echo "export PS1='\[\033[02;34m\]\u@\H:\[\033[02;37m\]\w\$\[\033[00m\] '" >> ~/.bash_profile
#function lll { ls -al $1 | more; }
#yum -y install traceroute


# cleanup unnecesary rpm
##############################################################################
yum -y erase chef
yum -y erase facter


# Install & configure Chef-client
##############################################################################
true && curl -L https://www.opscode.com/chef/install.sh | bash
mkdir -p /etc/chef/
cp /vagrant/node1.rb /etc/chef/client.rb
cp /vagrant/adeptize-validator.pem /etc/chef/




###TODO:
# Create a chef role to host a sample web app
# Setup a nexus repo
# Create a cloud AMI and make it a chef-client

