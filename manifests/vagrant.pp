class basenode {
  include '::ntp'

  file { '/etc/puppet/hiera.yaml':
    ensure => file,
  }

}

node /^web\d{2}.example.com$/ {
  include basenode
  include apache
}

node 'haproxy.example.com' {
  include basenode
  $webserver = ['192.168.50.50','192.168.50.52', '192.168.50.56', '192.168.50.58']
  include haproxy
}
