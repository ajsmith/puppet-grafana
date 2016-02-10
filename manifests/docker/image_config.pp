# == Class: grafana::docker::image_config
#
# Configuration of the Grafana docker image.

class grafana::docker::image_config (
  $docker_dir,
) {

  file { "${docker_dir}/grafana.ini":
    ensure  => present,
    content => template('grafana/etc/grafana/grafana.ini.erb'),
  }

}
