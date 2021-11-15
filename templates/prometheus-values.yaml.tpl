serviceAccounts:
  server:
    create: false
    name: prometheus-server
alertmanager:
  enabled: false
server:
  remoteWrite:
    - url: "${ prometheus_endpoint }"
      sigv4:
        region: eu-west-1
      queue_config:
        max_samples_per_send: 1000
        max_shards: 200
        capacity: 2500
