# == Class: grafana::docker::data_volume_container
#
# Configure a systemd service to run a Grafana data volume container.

define grafana::docker::data_volume_container (
  $image = 'grafana',
) {
  docker_systemd::data_volume_container { $title:
    image => $image,
  }
}
