class selenium_server::service {

  include ::systemd

  file { "/etc/systemd/system/selenium_server.service":
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template("${module_name}/selenium_server.service.erb"),
    before  => Service['selenium_server']
  } ~>
  Exec['systemctl-daemon-reload']

  service { 'selenium_server':
    enable     => true,
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    provider   => 'systemd',
  }
}
