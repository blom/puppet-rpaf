# Installs and configures mod_rpaf.
class rpaf(
  $package       = 'libapache2-mod-rpaf',
  $config_file   = '/etc/apache2/mods-available/rpaf.conf',
  $ifmodule      = 'rpaf_module',
  $enable        = true,
  $sethostname   = true,
  $proxy_ips     = ['127.0.0.1', '::1'],
  $header        = 'X-Forwarded-For',
  $template_file = '',
) {

  $real_enable = $enable ? {
    true  => 'On',
    false => 'Off',
  }

  $real_sethostname = $sethostname ? {
    true  => 'On',
    false => 'Off',
  }

  $real_template = $template_file ? {
    ''      => 'rpaf/rpaf.conf.erb',
    default => $template_file
  } 

  package { $package:
    ensure => present,
    before => File[$config_file],
  }

  file { $config_file:
    ensure  => present,
    content => template($real_template),
  }
}
