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

magic_shell_environment 'PS1' do
  value '\[\033[02;34m\]\u@\H:\[\033[02;37m\]\w\$\[\033[00m\] '
end

