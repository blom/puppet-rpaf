# Installs and configures mod_rpaf.
class rpaf(
  $package     = 'libapache2-mod-rpaf',
  $config_file = '/etc/apache2/mods-available/rpaf.conf',
  $ifmodule    = 'rpaf_module',
  $enable      = true,
  $sethostname = true,
  $proxy_ips   = ['127.0.0.1', '::1'],
  $header      = 'X-Forwarded-For'
) {
  $real_enable = $enable ? {
    true  => 'On',
    false => 'Off',
  }

  $real_sethostname = $sethostname ? {
    true  => 'On',
    false => 'Off',
  }

  package { $package:
    ensure => present,
    before => File[$config_file],
  }

  file { $config_file:
    ensure  => present,
    content => template('rpaf/rpaf.conf.erb'),
  }
}
