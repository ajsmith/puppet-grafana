# == Class: grafana::docker::image
#
# Configure a host to build the Grafana docker image.

class grafana::docker::image (
  $image_config_cls = 'image_config',
  $vcs_revision     = '1.0',
) {

  vcsrepo { '/opt/docker-grafana':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/ajsmith/docker-grafana.git',
    revision => $vcs_revision,
  }

  ~>
  class { $image_config_cls: }

  ~>
  docker::image { 'grafana':
    ensure     => present,
    docker_dir => '/opt/docker-grafana/',
  }

}
