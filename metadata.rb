name             'stager'
maintainer       'Adam Enger'
maintainer_email 'adamenger@gmail.com'
license          'All rights reserved'
description      'Installs/Configures stager'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'apt'
depends 'build-essential'
depends 'docker'
depends 'nginx'
depends 'runit'
