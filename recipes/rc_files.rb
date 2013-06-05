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

# Configure zsh system wide
ruby_block 'configure zsh system wide' do
  block do
    zshenv = Chef::Util::FileEdit.new('/etc/zsh/zshenv')
    zshenv.insert_line_if_no_match 'DEBIAN_PREVENT_KEYBOARD_CHANGES=yes', 'DEBIAN_PREVENT_KEYBOARD_CHANGES=yes'
    zshenv.write_file
    zprofile = Chef::Util::FileEdit.new('/etc/zsh/zprofile')
    zprofile.insert_line_if_no_match 'source /etc/profile', 'source /etc/profile'
    zprofile.write_file
  end
  only_if 'test -d /etc/zsh'
end
