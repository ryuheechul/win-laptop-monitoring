# Monitoring Windows 10 machine

> it's a part of [my Windows personalizations](https://gist.github.com/ryuheechul/494f4e6f08eaca34ef00ab8b238eca2a)

This little setup is with these assumptions: 
- this runs on WSL2
- OhmGraphite is already running on Windows side, read [docs/OhmGraphite.md](./docs/OhmGraphite.md) for more details

## Prepare

### with direnv
create `.envrc` file and put something like below

```bash
export HOST_OHMGRAPHITE=[windows-host-ip]
export HOST_PROMETHEUS=$(dig +short host.docker.internal)
```

### without direnv
just run those export commands before run

## Run

`make run` or read [Makefile](./Makefile) for more options

## Configure and Observe

Prometheus data source is already configured via [grafana/datasource-prom.yaml](./grafana/datasource-prom.yaml).

Open a browser and access grafana via http://localhost:3000.

Just import this https://grafana.com/grafana/dashboards/11587 and you should be good to go.

More info on this at https://github.com/nickbabcock/OhmGraphite.

## Stop

`make stop` or read [Makefile](./Makefile) for more options

