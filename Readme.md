# Buildkite Rails Docker Parallel Pipeline Example

[![Build status](https://badge.buildkite.com/aab023f2f33ab06766ed6236bc40caf0df1d9448e4f590d0ee.svg?branch=main)](https://buildkite.com/buildkite/rails-docker-parallel-example)
[![Add to Buildkite](https://buildkite.com/button.svg)](https://buildkite.com/new)

This repository is an example of how to easily run a large number of parallel testing agents for a [Rails](https://rubyonrails.org/) application using [Buildkite](https://buildkite.com/), [Docker](https://www.docker.com) and [Knapsack](https://github.com/ArturT/knapsack). This approach works well with Docker available autoscaling environments like the [Buildkite AWS Stack](https://buildkite.com/buildkite/buildkite-aws-stack).

This repository doesn't actually include a Rails sample application, but has the same CI scripts, `Dockerfile` and `docker-compose.yml` you would use for a production application. For a non-Docker based setup, see the [Rails Parallel Example](https://github.com/buildkite/rails-parallel-example).

See the full [Getting Started Guide](https://buildkite.com/docs/guides/getting-started) for step-by-step instructions on how to get this running, or [Add to Buildkite](https://buildkite.com/new) to try it yourself.

<a href="https://buildkite.com/buildkite/rails-docker-parallel-example/builds?branch=main"><img width="1491" alt="Screenshot of Buildkite Rails Docker Parallel example pipeline" src=".buildkite/screenshot.png" /></a>

Files to note:

* [docker-compose.yml](docker-compose.yml) - sets up the app to be able to run via [Buildkite’s Docker Compose support](https://buildkite.com/docs/guides/docker-containerized-builds)
* [Dockerfile](Dockerfile) - setups up the entire Ruby environment, including a waiter script to help wait for Posgtres, Redis and Memcache to become available
* [.buildkite/pipeline.yml](.buildkite/pipeline.yml) - the pipeline config showing how to have parallel steps
* [scripts/ci/parallel_specs.sh](scripts/ci/parallel_specs.sh) - runs the specs in parallel using Knapsack

## How does it work?

In the [pipeline configuration file](.buildkite/pipeline.yml) the `parallelism` property for the test step is set to 20. When a build, the step will appear 20 times in the pipeline, each with different environment variables exposed so you can divvy up your test suite accordingly. You can set the parallelism as high as you need to bring down your build times.

See the [parallelizing builds guide](https://buildkite.com/docs/guides/parallelizing-builds) for more information to create parallelized and distributed builds with Buildkite.

See the [Containerized Builds with Docker guide](https://buildkite.com/docs/guides/docker-containerized-builds) for information on how to use Docker Compose with Buildkite pipelines.

Consult the [Knapsack documentation](https://github.com/ArturT/knapsack) for configuring your database and dependent services to support running parallel steps on the one machine.

## Knapsack Pro

See [Knapsack Pro version of this example pipeline](https://github.com/KnapsackPro/buildkite-rails-docker-parallel-example-with-knapsack_pro) for how to perform dynamic splits/allocation of test nodes.

## Running locally

To run the specs locally on your development machine, you can run:

```bash
docker-compose run app scripts/ci/parallel_specs.sh
```

## License

See [Licence.md](Licence.md) (MIT)
