#
# Cookbook Name:: system_base
# Recipe:: aws_environment
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

# execute python recipe
include_recipe 'python'
# Install and configure the aws-cli tools
python_pip 'awscli' do
  action :install
end

# Install autocompletion for asw cli tools
template '/etc/profile.d/aws-cli.sh' do
  source 'aws-cli.sh.erb'
  owner 'root'
  group 'root'
  mode 0644
end
