class { '::keepalived::vrrp':
  global_defs => {
    router_id => $::hostname,
  },
  instances => {
    web => {
      advert_int        => '3',
      authentication    => {
        auth_type => 'PASS',
        auth_pass => 'abcd1234',
      },
      interface         => 'eth1',
      priority          => '50',
      state             => 'MASTER',
      virtual_ipaddress => {
        '10.0.0.13/24' => 'dev eth0 label eth0:13',
        '10.0.1.13/24' => 'dev eth1 label eth1:13',
      },
      virtual_router_id => '13',
    },
  },
}
