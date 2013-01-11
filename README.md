puppet-rpaf
===========

[![Build Status](https://secure.travis-ci.org/blom/puppet-rpaf.png)](https://travis-ci.org/blom/puppet-rpaf)

* [Homepage](https://github.com/blom/puppet-rpaf)

Puppet module for installing and configuring [mod_rpaf][1].

Usage
-----

    class { 'rpaf': }

Defined parameters and their defaults:

    package      'libapache2-mod-rpaf'
    config_file  '/etc/apache2/mods-available/rpaf.conf'
    ifmodule     'rpaf_module'
    enable       true
    sethostname  true
    proxy_ips    ['127.0.0.1', '::1']
    header       'X-Forwarded-For'

So to change header to X-Real-IP:

    class { 'rpaf':
      header => 'X-Real-IP',
    }

[1]: http://stderr.net/apache/rpaf/
