define grafana::docker::data_volume_container (
  $image            = 'grafana',
  $depends          = undef,
  $links            = undef,
  $restart_service  = undef,
  $running          = undef,
  $volumes_from     = undef,
  $extra_parameters = undef,
) {

  docker_systemd::volume_container { "$title":
    image            => $image,
    depends          => $depends,
    volumes_from     => $volumes_from,
  }

}
