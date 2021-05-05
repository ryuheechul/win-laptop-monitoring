# Monitoring Windows 10 laptop

## What didn't work for me

I tried with https://github.com/prometheus-community/windows_exporter

> https://community.chocolatey.org/packages/prometheus-windows-exporter.install

`choco install prometheus-windows-exporter.install --params '"/EnabledCollectors:cpu,thermalzone /ListenPort:9182"'`

But the temperature didn't work for me. Maybe it's related to this, https://github.com/prometheus-community/windows_exporter/issues/443#issuecomment-569249516.


## OhmGraphite to rescue

So I switched to https://github.com/nickbabcock/OhmGraphite. Despite the name of the repo it supports Prometheus as well.

### Steps to install and start

There is no chocolatey install at the time of writing this but the repo itself is informative.

Follow instructions:
- https://github.com/nickbabcock/OhmGraphite#getting-started-windows
- https://github.com/nickbabcock/OhmGraphite#prometheus-configuration 

### My config looks like this

```xml
# OhmGraphite.exe.config

<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <appSettings>
    <add key="type" value="prometheus" />
    <add key="prometheus_host" value="*" />
    <add key="prometheus_port" value="4445" />
  </appSettings>
</configuration>
```

### Troubleshoot

When I tried `<add key="prometheus_host" value="0.0.0.0" />`

It did not start properly with `.\OhmGraphite.exe start` and the log on console wasn't super helpful.

Luckily there are [debugging tips](https://github.com/nickbabcock/OhmGraphite#debugging-tips) (and look at log file).
Alternatively `.\OhmGraphite.exe` should show you the log real time as well.

### Prometheus

Go to [../README.md](../README.md)
