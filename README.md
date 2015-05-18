# puppet-grafana

#### Table of Contents

 1. [Overview](#overview)
 2. [Usage](#usage)
 3. [Compatibility](#compatibility)

## Overview

This module configures the Grafana monitoring dashboard on a host in the
simplest way possible. It installs Grafana from a package, rather than building
from source (how you acquire that package is up to you).

## Usage

Here's a basic configuration:

    class {'::grafana':}

## Compatibility

This module should be compatible with most popular GNU/Linux server
distributions, but has so far only been tested on Red Hat systems (Fedora,
CentOS, RHEL).

## Release Notes

2015/05/18 - v0.2.0 release.
