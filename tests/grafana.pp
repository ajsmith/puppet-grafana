grafana::docker::container { 'grafana':
  publish => ['3000:3000/tcp'],
}
