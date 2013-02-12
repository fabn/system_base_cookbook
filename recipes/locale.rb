#
# Cookbook Name:: system_base
# Recipe:: locale
#
# Copyright (C) 2013 Fabio Napoleoni
#

# Configures locale for ubuntu systems
template '/etc/defaults/locale' do
  source 'locale.erb'
  owner 'root'
  group 'root'
  mode 0644
end
