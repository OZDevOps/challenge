class haproxy {
  package { 'haproxy': 
    ensure => installed,
  }

  file { '/etc/default/haproxy':
    content => "ENABLED=1\n",
    require => Package['haproxy'],
  }

  service { 'haproxy':
    ensure => running,
    enable => true,
    require => Package['haproxy'],
  }

  file { '/etc/haproxy/haproxy.cfg':
    content => template('haproxy/haproxy.cfg.erb'),
    require => Package['haproxy'],
    notify => Service['haproxy'],
  }
}
