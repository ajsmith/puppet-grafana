# puppet-grafana

#### Table of Contents

 1. [Overview](#overview)
 2. [Usage](#usage)
 3. [Compatibility](#compatibility)
 4. [Release Notes](#release-notes)

## Overview

This module is useful for deploying Grafana as a Docker container on Red Hat
systems.

This module configures the Grafana monitoring dashboard on a host in the
simplest way possible. It installs Grafana from a package, rather than building
from source (how you acquire that package is up to you).

## Usage

### Running the Container

To run Grafana as a service, containers are configured to run as systemd
services.

The simplest configuration to run the Grafana container is:

```puppet
grafana::docker::container { 'grafana': }
```

More than likely, you'll want to manage persistent data using the
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

## Compatibility

This module is compatible with Red Hat Linux systems which are capable of
running Docker:

  * RHEL 7+
  * CentOS 7+
  * Fedora 20+

## Release Notes

### v0.5.0 (unreleased)

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
