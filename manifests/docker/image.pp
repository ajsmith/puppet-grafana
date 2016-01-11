# == Class: grafana::docker::image
#
# Configure a host to build the Grafana docker image.

class grafana::docker::image {

  vcsrepo { '/opt/docker-grafana':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/ajsmith/docker-grafana.git',
    revision => '1.0',
  }

  ~>
  file { '/opt/docker-grafana/grafana.ini':
    ensure  => present,
    content => template('grafana/etc/grafana/grafana.ini.erb'),
  }

  ~>
  docker::image { 'grafana':
    ensure     => present,
    docker_dir => '/opt/docker-grafana/',
  }

}
