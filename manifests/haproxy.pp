class marathon_template::haproxy (

  $version => '1.5' 

){ 
  # Ensure we get SSL haproxy
  include ::apt
  apt::ppa {"ppa:vbernat/haproxy-${version}":}
  package { 'haproxy': ensure => present }
  Apt::Ppa['ppa:vbernat/haproxy-1.5'] -> Package['haproxy']

}
