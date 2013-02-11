#
# Cookbook Name:: system_base
# Recipe:: default
#
# Copyright (C) 2013 Fabio Napoleoni
#

# Update package cache
if node[:system_base][:packages].any?
  case node['platform_family']
    when 'debian'
      include_recipe 'apt'
    else
      # do nothing
  end
end

# install package specified in attributes
# see http://wiki.opscode.com/display/chef/Resources#Resources-Package
node[:system_base][:packages].each do |p|
  package p[:name] do
    version p[:version] if p[:version]
    action p[:action] if p[:action]
  end
end