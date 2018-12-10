class selenium_server (

  $chrome_driver_version   = $selenium_server::params::chrome_driver_version,
  $selenium_server_version = $selenium_server::params::selenium_server_version,
  $owner                   = 'ubuntu',
  $group                   = 'ubuntu'

) inherits selenium_server::params {

  anchor {'selenium_server::begin':
    before => Class['selenium_server::install']
  }
  class {'selenium_server::install':
    require => Anchor['selenium_server::begin']
  }
  class {'selenium_server::config':
    require => Class['selenium_server::install']
  }
  class {'selenium_server::service':
    subscribe => Class['selenium_server::config']
  }
  anchor {'selenium_server::end':
    require => Class['selenium_server::service']
  }
}
