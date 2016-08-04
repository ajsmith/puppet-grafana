# == Class: grafana::docker::container
#
# Configure a systemd service to run a Grafana container.

define grafana::docker::container (
  $image            = 'ajsmith/grafana',
  $pull_image       = false,
  $depends          = undef,
  $link             = undef,
  $publish          = undef,
  $volumes_from     = undef,
  $volume           = undef,
  $systemd_env_file = undef,
) {

  docker_systemd::container { $title:
    image            => $image,
    pull_image       => $pull_image,
    depends          => $depends,
    link             => $link,
    publish          => $publish,
    volumes_from     => $volumes_from,
    volume           => $volume,
    systemd_env_file => $systemd_env_file,
  }

}
