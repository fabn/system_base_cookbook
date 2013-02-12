#
# Cookbook Name:: system_base
# Recipe:: rc_files
#
# Copyright (C) 2013 Fabio Napoleoni
#

# Global configuration for git
template '/etc/gitconfig' do
  source 'gitconfig.erb'
  owner 'root'
  group 'root'
  mode 0644
end

template '/etc/gitignore' do
  source 'gitignore.erb'
  owner 'root'
  group 'root'
  mode 0644
end
