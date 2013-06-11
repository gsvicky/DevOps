#
# Cookbook Name:: deployapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "cp -f /vagrant/sample.war $CATALINA_HOME/webapps/" do
end

