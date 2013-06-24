#
# Cookbook Name:: system_base
# Recipe:: secrets
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

# Load additional attributes from secrets encrypted databags
data_bag(node[:system_base][:secrets_data_bag]).each do |secret|
  # decrypt the databag item
  decrypted = Chef::EncryptedDataBagItem.load(node[:system_base][:secrets_data_bag], secret)
  secret_id = decrypted['id']
  Chef::Log.info("Loading attributes from #{secret_id} (in bag #{node[:system_base][:secrets_data_bag]})")
  # Override (using deep merge) attributes from encrypted ones
  node.override[secret_id] = decrypted[secret_id]
end
