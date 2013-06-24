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
* __system_base::rc_files__: Install some system wide configuration files for aliases, git configuration and other shell features
* __system_base::secrets__: Add encrypted databag items as node attributes
* __system_base::mysql_config__: Configure mysql for passwordless usage by root user and install some system utilities

# Recipes howto

### system_base::secrets

This recipe read attributes from encrypted data bags and add them to the node during execution. For this reason this recipe
 should be one of the first in the list of executed ones. Given there is an encrypted databag with this content

```json
{
  "id": "mysql",
  "mysql": {
    "server_root_password": "root_password",
    "server_repl_password": "replication_password",
    "server_debian_password": "debian_password"
  }
}
```

After recipe execution `node[:mysql][:server_root_password]` will contain the decripted password (as override attribute).

The only configurable parameter is `node[:system_base][:secrets_data_bag]` (default: `'secret'`). Attributes are added
under databag id namespace, so it's not possible to add a top level attribute (such as node[:foo])

# Author

Author:: Fabio Napoleoni (<f.napoleoni@gmail.com>)
