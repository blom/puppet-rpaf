puppet-rpaf
===========

[![Build Status](https://travis-ci.org/blom/puppet-rpaf.png)](https://travis-ci.org/blom/puppet-rpaf)

* [Homepage](https://github.com/blom/puppet-rpaf)
* [Puppet Forge](https://forge.puppetlabs.com/blom/rpaf)

Puppet module for [mod_rpaf][1].

Installation
------------

    puppet module install blom/rpaf

Usage
-----

    class { 'rpaf':
    }

Takes the following optional attributes:

* `package`: Package name (default: `libapache2-mod-rpaf`).
* `config_file`: Configuration file
   (default: `/etc/apache2/mods-available/rpaf.conf`).
* `ifmodule`: Module identifier or filename (default: `rpaf_module`).
* `enable`: Enable rpaf (default: `true`).
* `sethostname`: Define `Host` from `X-Host` (default: `true`).
* `proxy_ips`: Proxy IPs (default: `['127.0.0.1', '::1']`).
* `header`: Header containing the remote address (default: `X-Forwarded-For`).

See the [rpaf documentation][1] for more information.

[1]: http://stderr.net/apache/rpaf/
