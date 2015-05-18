# == Class: grafana
#
# Configures Grafana monitoring dashboard.
#
# === Parameters
#
# [http_port]
#   Port to configure HTTP to listen on. Default: 80

class grafana (
  $http_port = 80,
  ) {

  package {'grafana':
    ensure => installed,
  }

  file {'/etc/httpd/conf.d/grafana.conf':
    ensure  => present,
    content => template('grafana/etc/httpd/conf.d/grafana.conf.erb'),
  }

}
