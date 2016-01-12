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

### Building the Image

Add the following to configure a host to build a Grafana image: [^1]

```puppet
include grafana::docker::image
```

[^1]: This uses the Docker image resources provided by
<https://github.com/ajsmith/docker-grafana>.

### Running the Container

To run Grafana as a service, containers are configured to run as systemd
services.

The simplest configuration to run the Grafana container is:

```puppet
grafana::docker::container { 'grafana': }
```

More than likely, you'll want to manage persistent data using the [data volume
container
pattern](https://docs.docker.com/userguide/dockervolumes/#creating-and-mounting-a-data-volume-container). To implement that, we do the following:

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

### 2016/01/11 v0.3.3

- Style fixes.

### 2016/01/11 v0.3.2

- Initial release.
