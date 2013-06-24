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
* __system_base::aws_environment__: Install aws cli tools on the node

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

### system_base::aws_environment

This recipe configures aws cli tools and command line completion for it on the node.

It also try to setup aws credentials for root user using the following approach,
 it tries to load an encrypted data bag named `aws::main` with the following content:

```json
{
  "id": "main",
  "aws_access_key_id": "YOUR_ACCESS_KEY",
  "aws_secret_access_key": "YOUR_SECRET_ACCESS_KEY"
}
```

Then for every environment variable found in that databag it writes a file (owned by root with 0600 permissions) with
 all the environment settings found in that data bag. That file will be put into /etc/profile.d/aws-environment.sh
 and it will loaded into login (and possibly non login) shells for root. Environment variables created are names of
 data bag items (all but `id`) uppercased.

If you think that this is a security flaw (if someone gains root privileges on your machine you'll have bigger problems
 than this) just do not create the databag item and the environment file won't be created.

Please also notice that for your own security you should create a [IAM account](http://aws.amazon.com/iam/) with a minimum
 set of privileges required to accomplish the task it's used for. For instance if you use it to take EBS snapshots you'll
 likely need only `ec2_describe_instances` and `ec2_create_snapshot` so create an user with only these privileges.

# Author

Author:: Fabio Napoleoni (<f.napoleoni@gmail.com>)
