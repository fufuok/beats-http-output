# Beats - HTTP output


## Usage

Beat  | Description
--- | ---
[Auditbeat](https://github.com/elastic/beats/tree/main/auditbeat) | Collect your Linux audit framework data and monitor the integrity of your files.
[Filebeat](https://github.com/elastic/beats/tree/main/filebeat) | Tails and ships log files
[Functionbeat](https://github.com/elastic/beats/tree/main/x-pack/functionbeat) | Read and ships events from serverless infrastructure.
[Heartbeat](https://github.com/elastic/beats/tree/main/heartbeat) | Ping remote services for availability
[Metricbeat](https://github.com/elastic/beats/tree/main/metricbeat) | Fetches sets of metrics from the operating system and services
[Packetbeat](https://github.com/elastic/beats/tree/main/packetbeat) | Monitors the network and applications by sniffing packets
[Winlogbeat](https://github.com/elastic/beats/tree/main/winlogbeat) | Fetches and ships Windows Event logs
[Osquerybeat](https://github.com/elastic/beats/tree/main/x-pack/osquerybeat) | Runs Osquery and manages interraction with it.

```shell
git clone https://github.com/fufuok/beats-http-output.git
go mod tidy
make filebeat
make metricbeat
```

Build all programs:

```shell
make
```

Build Windows programs:

```shell
cd filebeat
go build .
```

## Acknowledgements

-  [jpchev/beats at features/httpOutputPluginFilebeat (github.com)](https://github.com/jpchev/beats/tree/features/httpOutputPluginFilebeat) 

## Configure the Http output

Http output



The Http output sends events directly to a Http endpoint.

**Example configuration:**

```yaml
output.http:
  hosts: ["https://myhost"]
```

**Basic authentication:**

```yaml
output.http:
  hosts: ["https://myhost"]
  username: "{user}"
  password: "{pwd}"
```

#### Configuration options

You can specify the following options in the `http` section of the {beatname_lc}.yml config file:

##### `protocol`

The enabled config is a string to set the protocol.

The default value is ``.

##### `path`

The path of the http endpoint to connect to (it can be also specified in hosts)

The default value is ``

```yaml
output.http:
  hosts: ["https://myhost"]
  path: /api
```

or

```yaml
output.http:
  hosts: ["https://myhost/api"]
```

##### `proxy_url`

The http proxy to use

The default value is ``

```yaml
output.http:
  hosts: ["https://myhost"]
  proxy_url: "http://myproxy:8080"
```

##### `loadbalance`

To load balance across several hosts

The default value is `false`

```yaml
output.http:
  hosts: ["https://myhost1", "https://myhost2"]
  loadbalance: true
```

##### `batch_publish`

The default value is `false`

```yaml
output.http:
  hosts: ["https://myhost"]
  batch_publish: true
```

##### `batch_size`

The default value is `2048`

```yaml
output.http:
  hosts: ["https://myhost"]
  batch_publish: true
```

##### `compression_level`

Between 0 and 9. The default value is `0`

```yaml
output.http:
  hosts: ["https://myhost"]
  compression_level: 1
```

##### `tls`

to use client certificates

```yaml
output.http:
  hosts: ["https://myhost"]
  tls: 1
```

##### `max_retries`

The default value is `3`

```yaml
output.http:
  hosts: ["https://myhost"]
  max_retries: 3
```

##### `timeout`

The default value is `90s`

```yaml
output.http:
  hosts: ["https://myhost"]
  timeout: 180s
```

##### `headers`

To set http headers

```yaml
output.http:
  hosts: ["https://myhost"]
  headers:
    h1: v1
    h2: v2
```

##### `content_type`

To set contenty type of the http request

```yaml
output.http:
  hosts: ["https://myhost"]
  content_type: "text/json"
```

##### `backoff`

Backoff init and max values, in time.Duration type The default value is `backoff.init: 1s` `backoff.max: 60s`

```yaml
output.http:
  hosts: ["https://myhost"]
  backoff.init: 10s
  backoff.max: 180s
```

##### `format`

It can be `json` or `json_lines`. The default value is `json`

```yaml
output.http:
  hosts: ["https://myhost"]
  format: "text"
```


## Documentation and Getting Started

You can find the documentation and getting started guides for each of the Beats
on the [elastic.co site](https://www.elastic.co/guide/):

* [Beats platform](https://www.elastic.co/guide/en/beats/libbeat/current/index.html)
* [Auditbeat](https://www.elastic.co/guide/en/beats/auditbeat/current/index.html)
* [Filebeat](https://www.elastic.co/guide/en/beats/filebeat/current/index.html)
* [Functionbeat](https://www.elastic.co/guide/en/beats/functionbeat/current/index.html)
* [Heartbeat](https://www.elastic.co/guide/en/beats/heartbeat/current/index.html)
* [Metricbeat](https://www.elastic.co/guide/en/beats/metricbeat/current/index.html)
* [Packetbeat](https://www.elastic.co/guide/en/beats/packetbeat/current/index.html)
* [Winlogbeat](https://www.elastic.co/guide/en/beats/winlogbeat/current/index.html)

## Documentation and Getting Started information for the Elastic Agent

You can find the documentation and getting started guides for the Elastic Agent
on the [elastic.co site](https://www.elastic.co/downloads/elastic-agent)

## Getting Help

If you need help or hit an issue, please start by opening a topic on our
[discuss forums](https://discuss.elastic.co/c/beats). Please note that we
reserve GitHub tickets for confirmed bugs and enhancement requests.

## Downloads

You can download pre-compiled Beats binaries, as well as packages for the
supported platforms, from [this page](https://www.elastic.co/downloads/beats).

## Contributing

We'd love working with you! You can help make the Beats better in many ways:
report issues, help us reproduce issues, fix bugs, add functionality, or even
create your own Beat.

Please start by reading our [CONTRIBUTING](CONTRIBUTING.md) file.

## Building Beats from the Source

See our [CONTRIBUTING](CONTRIBUTING.md) file for information about setting up
your dev environment to build Beats from the source.

## Snapshots

For testing purposes, we generate snapshot builds that you can find [here](https://artifacts-api.elastic.co/v1/search/8.0-SNAPSHOT/). Please be aware that these are built on top of main and are not meant for production.

## CI

### PR Comments

It is possible to trigger some jobs by putting a comment on a GitHub PR.
(This service is only available for users affiliated with Elastic and not for open-source contributors.)

* [beats][]
  * `jenkins run the tests please` or `jenkins run tests` or `/test` will kick off a default build.
  * `/test macos` will kick off a default build with also the `macos` stages.
  * `/test <beat-name>` will kick off the default build for the given PR in addition to the `<beat-name>` build itself.
  * `/test <beat-name> for macos` will kick off a default build with also the `macos` stage for the `<beat-name>`.
* [apm-beats-update][]
  * `/run apm-beats-update`
* [apm-beats-packaging][]
  * `/package` or `/packaging` will kick of a build to generate the packages for beats.
* [apm-beats-tester][]
  * `/beats-tester` will kick of a build to validate the generated packages.

### PR Labels

It's possible to configure the build on a GitHub PR by labelling the PR with the below labels

* `<beat-name>` to force the following builds to run the stages for the `<beat-name>`
* `macOS` to force the following builds to run the `macos` stages.

[beats]: https://beats-ci.elastic.co/job/Beats/job/beats/
[apm-beats-update]: https://beats-ci.elastic.co/job/Beats/job/apm-beats-update/
[apm-beats-packaging]: https://beats-ci.elastic.co/job/Beats/job/packaging/
[apm-beats-tester]: https://beats-ci.elastic.co/job/Beats/job/beats-tester/
