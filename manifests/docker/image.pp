# == Class: grafana::docker::image
#
# Configure a host to build the Grafana docker image.
#
# === Parameters
#
# [docker_dir]
#
#   The path to the directory which should hold the Grafana Docker resources.
#
# [vcs_revision]
#
#   The revision of Grafana Docker that should be used. Usually this should be
#   left to the default.
#
# [image_config_cls]
#
#   The name of the class which customizes the configuration of the Grafana
#   Docker image. A different class can be provided here to further customize
#   the Grafana image.
#

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
