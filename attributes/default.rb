#
# Author:: Fabio Napoleoni (<f.napoleoni@gmail.com>)
# Cookbook Name:: system_base
# Attributes:: default

# packages to install in the default recipe, it should be an array of package spec
# a package spec can be given as a hash in this form
# {
#   name: 'foo-package', version: '1.2.3', action: 'install'
# }
default[:system_base][:packages] = []

# locale attributes
default[:system_base][:locale][:lang] = 'en_US.UTF-8'
default[:system_base][:locale][:language] = default[:system_base][:locale][:lang]
default[:system_base][:locale][:lc_all] = default[:system_base][:locale][:lang]
