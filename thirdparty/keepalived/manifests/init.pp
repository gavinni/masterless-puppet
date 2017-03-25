# Class: keepalived
#
# Install, enable and configure the keepalived VRRP and LVS management daemon.
#
# Parameters:
#  $content:
#    File content for keepalived.conf. Default: none
#  $source:
#    File source for keepalived.conf. Default: none
#  $options:
#    Command-line options to keepalived. Default: -D
#
# Sample Usage :
#  class { '::keepalived':
#    source  => 'puppet:///mymodule/keepalived.conf',
#    options => '-D --vrrp',
#  }
#
class keepalived (
  $content           = undef,
  $source            = undef,
  $service           = $::keepalived::params::service,
  $confdir           = $::keepalived::params::confdir,
  $package           = $::keepalived::params::package,
  $sysconfdir        = $::keepalived::params::sysconfdir,
  $options           = '-D',
  $service_enable    = true,
  $service_ensure    = 'running',
  $service_hasstatus = $::keepalived::params::service_hasstatus,
  $service_restart   = $::keepalived::params::service_restart,
  $package_ensure    = 'installed',
) inherits ::keepalived::params {

  package { $package: ensure => $package_ensure }

  service { $service:
    ensure    => $service_ensure,
    enable    => $service_enable,
    require   => Package[$package],
    hasstatus => $service_hasstatus,
    restart   => $service_restart,
  }

  File {
    notify  => Service[$service],
    require => Package[$package],
  }

  # Optionally managed main configuration file
  if $content or $source {
    file { "${confdir}/keepalived.conf":
      content => $content,
      source  => $source,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

  if $sysconfdir == 'sysconfig' or $sysconfdir == 'conf.d' {
    # Configuration for VRRP/LVS disabling
    file { "/etc/${sysconfdir}/keepalived":
      content => template("keepalived/${sysconfdir}.erb"),
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
    }
  }

}

