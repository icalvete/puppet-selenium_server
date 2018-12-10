class selenium_server::install {

  include java

  file { '/usr/local/bin/chromedriver':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/chromedriver-${selenium_server::chrome_driver_version}",
  }

  file { '/usr/local/bin/selenium-server-standalone.jar':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "puppet:///modules/${module_name}/selenium-server-standalone-${selenium_server::selenium_server_version}.jar",
  }
}
