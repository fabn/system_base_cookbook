name 'system_base'
maintainer 'Fabio Napoleoni'
maintainer_email 'f.napoleoni@gmail.com'
license 'All rights reserved'
description 'Installs/Configures system  base packages and some other low level stuff'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

# this dependency is used in Debian/Ubuntu to ensure that the package cache is up to date
depends 'apt', '~> 1.7.0'