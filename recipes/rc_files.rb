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

# Global configuration for readline
template '/etc/inputrc' do
  source 'inputrc.erb'
  owner 'root'
  group 'root'
  mode 0644
end

# Shell aliases and inclusions
template '/etc/profile.d/shell_config.sh' do
  source 'shell_config.sh.erb'
  owner 'root'
  group 'root'
  mode 0644
end
