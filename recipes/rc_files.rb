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

# Configure zsh system wide
ruby_block 'configure zsh system wide' do
  block do
    zshenv = Chef::Util::FileEdit.new('/etc/zsh/zshenv')
    zshenv.insert_line_if_no_match /^DEBIAN_PREVENT_KEYBOARD_CHANGES=yes$/, 'DEBIAN_PREVENT_KEYBOARD_CHANGES=yes'
    zshenv.write_file
    zprofile = Chef::Util::FileEdit.new('/etc/zsh/zprofile')
    zprofile.insert_line_if_no_match %r{^source /etc/profile$}, 'source /etc/profile'
    zprofile.write_file
  end
  only_if 'test -d /etc/zsh'
end
