class apache::index {
  file { '/var/www/index.html':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
      content => template('apache/index.html.erb'),
  }
}
