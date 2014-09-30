name 'system_base'
maintainer 'Fabio Napoleoni'
maintainer_email 'f.napoleoni@gmail.com'
license          'Apache 2.0'
description 'Installs/Configures system  base packages and some other low level stuff'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'

supports 'ubuntu', '>= 12.04'
  
depends 'apt'
depends 'python'
