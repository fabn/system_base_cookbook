#
# Cookbook Name:: system_base
# Recipe:: rc_files
#
# Copyright (C) 2013 Fabio Napoleoni
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
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

cookbook_file '/etc/zsh/zprofile' do
  source 'zprofile'
  owner 'root'
  group 'root'
  mode 0644
  only_if { platform_family?('debian') && ::File.directory?('/etc/zsh') }
end

cookbook_file '/etc/zsh/zshenv' do
  source 'zshenv'
  owner 'root'
  group 'root'
  mode 0644
  only_if { platform_family?('debian') && ::File.directory?('/etc/zsh') }
end
