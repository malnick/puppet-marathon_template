class marathon_template (

  $template_location,

){

  include ::marathon_template::haproxy
  
  package { 'ruby':
    ensure    => present,
  }
  ->
  package { 'marathon-template': 
    ensure    => latest,
    provider  => 'gem',
  }
  ->
  file { '/etc/haproxy.yaml':
    ensure    => file,
    content   => template($template_location),
    mode      => '0644',
  }
#  ->
#  file { '/etc/init.d/marathon-template-init':
#    ensure    => file,
#    source    => 'puppet:///modules/marathon_template/init.sh',
#    mode      => '0755',
#  }
#  -> 
#  service { 'marathon-template-init':
#    ensure      => running,
#    hasrestart  => true,
#    enable      => true,
#  }
  -> 
  exec {'marathon-template':
    command => '/usr/local/bin/marathon-template',
    notify  => Service['haproxy'],
  }
}
