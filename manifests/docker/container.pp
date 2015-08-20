define grafana::docker::container (
  $image            = 'grafana',
  $depends          = undef,
  $links            = undef,
  $publish          = undef,
  $volumes_from     = undef,
) {

  docker_systemd::service { "$title":
    image        => $image,
    depends      => $depends,
    publish      => $publish,
    volumes_from => $volumes_from,
  }

}
