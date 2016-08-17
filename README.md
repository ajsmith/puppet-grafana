# puppet-grafana

#### Table of Contents

 1. [Overview](#overview)
 2. [Usage](#usage)
 3. [Compatibility](#compatibility)
 4. [Release Notes](#release-notes)

## Overview

This module deploys Grafana as a Docker container on Red Hat systems. The
Grafana container is managed as a systemd service.

## Usage

### Running the Container

The simplest configuration to run the Grafana container is:

```puppet
grafana::docker::container { 'grafana':
    publish => ['3000:3000/tcp'],
}
```

The above example configures a systemd service which runs the Grafana
container. It is started immediately and enabled to be started on system boot.

The following options are supported on `grafana::docker::container`:

  * `image`: The name of the Docker image to use.

  * `pull_image`: Always pull image before starting the container. (Default
    `false`)

  * `depends`: Dependencies on other systemd docker units which need to be
    started before this one. (List)

  * `link`: Containers which this container links to. (List)

  * `publish`: Ports which should be published by this container. (List)

  * `volume`: Volumes to be used by this container. (List)

  * `volumes_from`: Containers which this container mounts volumes from. (List)

  * `systemd_env_file`: Path to a systemd environment file to use.

### Configuring the Container

The Grafana container can be configured by mounting configuration files from
the host filesystem, as so:

```puppet
grafana::docker::container { 'grafana':
    publish => ['3000:3000/tcp'],
    volume  => ['/var/local/grafana/grafana.ini:/etc/grafana/grafana.ini:ro'],
}
```

Note you will need to create the configuration file
`/var/local/grafana/grafana.ini` for the above example to work. How you do that
is up to you.

### Persistent storage using a Data Volume Container

You may also want to manage persistent data using the
[data volume container pattern](https://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container).
To implement that, we do the following:

```puppet
grafana::docker::data_volume_container { 'grafana-data': }
->
grafana::docker::container { 'grafana':
  volumes_from => ['grafana-data'],
}
```

This first creates a service for the data volume container named
"grafana-data", then creates a service named "grafana" which mounts volumes
from that container.

The following options are supported on
`grafana::docker::data_volume_container`:

  * `image`: The name of the Docker image to use.

  * `pull_image`: Always pull image before starting the container. (Default
    `false`)

  * `systemd_env_file`: Path to a systemd environment file to use.

## Compatibility

This module is compatible with Red Hat Linux systems which are capable of
running Docker:

  * RHEL 7+
  * CentOS 7+
  * Fedora 20+

## Release Notes

### v0.6.0

### v0.5.2

- Documentation updates.

### v0.5.1

- Update default Grafana Docker image.

### v0.5.0

- Ugrade to ajsmith/docker_systemd v0.3.x.
- Add `pull_image` and `systemd_env_file` options to Docker container
  resources.
- Removed resources for building Grafana Docker images.

### v0.4.3 2016/08/01

- Support volume configuration for the Grafana Docker container.

### v0.4.1 2016/02/11

- Fix Grafana image version.

### v0.4.0 2016/02/10

- Use updated Grafana v2.6.0 image.
- Allow customizations to the Grafana Docker image build process.
- Add option to set the VCS revision of the Grafana Docker image.
- Improve rspec test coverage.

### v0.3.3 2016/01/11

- Style fixes.

### v0.3.2 2016/01/11

- Initial release.
