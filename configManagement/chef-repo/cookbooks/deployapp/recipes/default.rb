#
# Cookbook Name:: deployapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

#deploy the sample app
cookbook_file "/var/lib/tomcat6/webapps/sample.war" do
  source "sample.war"
  mode 0755
  owner "root"
  group "root"
end

