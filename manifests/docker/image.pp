# == Class: grafana::docker::image
#
# Configure a host to build the Grafana docker image.

class grafana::docker::image (
  $docker_dir       = '/opt/docker-grafana',
  $vcs_revision     = '1.0',
  $image_config_cls = 'image_config',
) {

  vcsrepo { $docker_dir:
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/ajsmith/docker-grafana.git',
    revision => $vcs_revision,
  }

  ~>
  class { $image_config_cls:
    docker_dir => $docker_dir,
  }

  ~>
  docker::image { 'grafana':
    ensure     => present,
    docker_dir => $docker_dir,
  }

}
