define grafana::docker::data_volume_container (
  $image = 'grafana',
) {
  docker_systemd::data_volume_container { "$title":
    image => $image,
  }
}
