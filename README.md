# system_base cookbook

# Requirements

This cookbook is used to setup some low level system configuration

It's used on Ubuntu systems and currently depends on following cookbooks

* depends 'apt', '~> 1.7.0'

# Attributes

See `attributes/default.rb` file for commented attributes used in various recipes

# Recipes

* __system_base::default__: Install packages defined in `node[:system_base][:packages]`
* __system_base::locale__: Install a template for `/etc/default/locale`

# Author

Author:: Fabio Napoleoni (<f.napoleoni@gmail.com>)
