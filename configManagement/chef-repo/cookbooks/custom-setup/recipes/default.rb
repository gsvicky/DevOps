#
# Cookbook Name:: custom-setup
# Recipe:: default
#
# Copyright 2013 
#
# All rights reserved - Do Not Redistribute
#
# Alias `h` to go home
magic_shell_alias 'h' do
  command 'cd ~'
end

