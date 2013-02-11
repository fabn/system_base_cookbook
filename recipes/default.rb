#
# Cookbook Name:: system_base
# Recipe:: default
#
# Copyright (C) 2013 Fabio Napoleoni
#

# install package specified in attributes
# see http://wiki.opscode.com/display/chef/Resources#Resources-Package
default[:system_base][:packages].each do |p|
  package p[:name] do
    version p[:version] if p[:version]
    action p[:action] if p[:action]
  end
end