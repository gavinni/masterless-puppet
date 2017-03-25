class profile::ldap {
#OpenLDAP setup
  class { 'openldap::server': }

  openldap::server::database { 'dc=somedir,dc=some,dc=com':
    directory => '/opt/openldap/some-data/',
    rootdn    => 'cn=admin,dc=somedir,dc=some,dc=com',
    rootpw    => hiera('openldap::server:rootpw'),
  }

  class { 'openldap::client':
    base => 'dc=somedir,dc=some,dc=com',
    uri  => ['ldap:///', 'ldapapi:///'],
    #tls_cacert => '/some/ssl/certs/cacert.pem',
  }

  openldap::server::module { 'memberof':
    ensure => present,
  }

  openldap::server::schema { 'cosine':
    ensure => present,
    path   => '/etc/openldap/schema/cosine.ldif',
  }

  openldap::server::schema { 'nis':
    ensure  => present,
    path    => '/etc/openldap/schema/nis.ldif',
    require => Openldap::Server::Schema['cosine'],
  }

  openldap::server::schema { 'inetorgperson':
    ensure  => present,
    path    => '/etc/openldap/schema/inetorgperson.ldif',
    require => Openldap::Server::Schema['nis'],
  }

  openldap::server::access {
    'to attrs=userPassword,shadowLastChange by dn="cn=admin,dc=somedir,dc=some,dc=com" on dc=somedir,dc=some,dc=com':
      access => 'write';
    'to attrs=userPassword,shadowLastChange by anonymous on dc=somedir,dc=some,dc=com':
      access => 'auth';
    'to attrs=userPassword,shadowLastChange by self on dc=somedir,dc=some,dc=com':
      access => 'write';
    'to attrs=userPassword,shadowLastChange by * on dc=somedir,dc=some,dc=com':
      access => 'none';
  }

  openldap::server::access { 'to dn.base="" by * on dc=somedir,dc=some,dc=com':
      access => 'read',
  }

  openldap::server::access {
    'to * by dn="cn=admin,dc=somedir,dc=some,dc=com" on dc=somedir,dc=some,dc=com':
      access => 'write';
    'to * by * on dc=somedir,dc=some,dc=com':
      access => 'read';
  }

}
