class marathon_template (

  $template_location,

){

  package { 'ruby':
    ensure    => present,
  }
  ->
  package { 'marathon-template': 
    ensure    => present,
    provider  => 'gem',
  }
  ->
  file { '/etc/haproxy.yaml':
    ensure    => file,
    content   => template($template_location),
    mode      => '0644',
  }
#  ->
#  file { '/etc/init.d/mesosphere_template':
#    ensure    => file,
#    content   => template('mesosphere_template/init.erb')
#    mode      => '0755',
#  }
  -> 
  service { 'marathon-template':
    ensure    => running,
    enable    => true,
  }

}
