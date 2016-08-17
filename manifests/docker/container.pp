# == Class: grafana::docker::container
#
# Configure a systemd service to run a Grafana container.

define grafana::docker::container (
  # General options
  $image            = 'ajsmith/grafana',
  $depends          = undef,
  $pull_image       = false,

  # docker-run options
  $env              = undef,
  $env_file         = undef,
  $link             = undef,
  $log_driver       = undef,
  $log_opt          = undef,
  $publish          = undef,
  $volume           = undef,
  $volumes_from     = undef,
  $systemd_env_file = undef,
) {

  docker_systemd::container { $title:
    image            => $image,
    depends          => $depends,
    pull_image       => $pull_image,
    env              => $env,
    env_file         => $env_file,
    link             => $link,
    log_driver       => $log_driver,
    log_opt          => $log_opt,
    publish          => $publish,
    volume           => $volume,
    volumes_from     => $volumes_from,
    systemd_env_file => $systemd_env_file,
  }

}
