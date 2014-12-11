class basenode {
  include '::ntp'

  file { '/etc/puppet/hiera.yaml':
    ensure => file,
  }

  file { '/etc/puppet/puppet.conf':
    ensure => file,
    source => 'puppet:///modules/haproxy/puppet.conf',
  }
}

node /^web\d{2}.example.com$/ {
  include basenode
  include apache
}

node 'haproxy.example.com' {
  include basenode
  include haproxy
}
