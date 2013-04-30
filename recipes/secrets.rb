#
# Cookbook Name:: system_base
# Recipe:: secrets
#
# Copyright (C) 2013 Fabio Napoleoni
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
