# Class: keepalived::params
#
# Parameters for the keepalived module.
#
class keepalived::params {

  $service = 'keepalived'
  $confdir = '/etc/keepalived'
  $service_restart = "/sbin/service ${service} reload"

  # We can't use osfamily since Gentoo's is 'Linux'
  case $::operatingsystem {
    'Gentoo': {
      $package           = 'sys-cluster/keepalived'
      $sysconfdir        = 'conf.d'
      $service_hasstatus = true
    }
    'RedHat','Fedora','CentOS','Scientific','Amazon': {
      $package           = 'keepalived'
      $sysconfdir        = 'sysconfig'
      $service_hasstatus = true
    }
    'Debian', 'Ubuntu': {
      $package           = 'keepalived'
      $sysconfdir        = undef
      $service_hasstatus = false
    }
    default: {
      $package           = 'keepalived'
      $sysconfdir        = undef
      $service_hasstatus = true
    }
  }

}
