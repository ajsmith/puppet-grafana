# == Class: grafana::docker::image_config
#
# Configuration of the Grafana docker image.

class grafana::docker::image_config {

  file { '/opt/docker-grafana/grafana.ini':
    ensure  => present,
    content => template('grafana/etc/grafana/grafana.ini.erb'),
  }

}
