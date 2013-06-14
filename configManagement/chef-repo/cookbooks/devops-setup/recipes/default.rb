#
# Cookbook Name:: devops-setup
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#Configure knife, chef-solo and Chef-client
directory "#{ENV['HOME']}/.chef/" do
  mode 00775
  owner "root"
  group "root"
  action :create
end

template "#{ENV['HOME']}/.chef/knife.rb" do
  source "knife.rb.erb"
  owner "root"
  group "root"
  mode "0644"
end

cookbook_file "#{ENV['HOME']}/.chef/knifeuser.pem" do
  source "knifeuser.pem"
  mode 0755
  owner "root"
  group "root"
end

directory "/etc/chef/" do
  mode 00775
  owner "root"
  group "root"
  action :create
  recursive true
end

template "/etc/chef/solo.rb" do
  source "solo.rb.erb"
  owner "root"
  group "root"
  mode "0755"
end

file "/etc/chef/client.rb" do
  action :delete
end

template "/etc/chef/client.rb" do
  source "client.rb.erb"
  owner "root"
  group "root"
  mode "0755"
end

cookbook_file "/etc/chef/adeptize-validator.pem" do
  source "adeptize-validator.pem"
  mode 0755
  owner "root"
  group "root"
end

#For convenience, create a link to the src folder in home
execute "Create chef link" do
  command "ln -s /usr/local/src/DevOps/configManagement/chef-repo ~/chefdir"
  action :run
end

execute "Create git link" do
  command "ln -s /usr/local/src/DevOps ~/gitdir"
  action :run
end

magic_shell_environment 'PS1' do
  value '\[\033[02;32m\]\u@\H:\[\033[02;36m\]\w\$\[\033[00m\] '
end
