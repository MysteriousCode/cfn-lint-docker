# cfn-lint-docker

[![Build docker image](https://github.com/MysteriousCode/cfn-lint-docker/actions/workflows/docker.yaml/badge.svg?branch=main)](https://github.com/MysteriousCode/cfn-lint-docker/actions/workflows/docker.yaml)

This repository was created to automatically build and publish public docker images for 
[aws-cloudformation/cfn-lint](https://github.com/aws-cloudformation/cfn-lint).

Since there's no official docker repository for [cfn-lint](https://github.com/aws-cloudformation/cfn-lint)
we have decided to create this repo and use Github Actions to automatically
build a new docker image for each cfn-lint [release](https://github.com/aws-cloudformation/cfn-lint/releases).

The GitHub Actions in this repo are triggered each day to check if a new release
of cfn-lint is available, so we can always have up-to-date docker image available!

## Usage

The images are published to a public ECR and Docker Hub repositories.
From there, use cfn-lint as usual - we simply use the [Dockerfile](https://github.com/aws-cloudformation/cfn-lint/blob/main/Dockerfile)
provided by [cfn-lint](https://github.com/aws-cloudformation/cfn-lint) repository, we do not apply any changes.

### From Docker Hub

Docker Hub repository: https://hub.docker.com/r/mysteriouscode/cfn-lint


To get the latest release of cfn-lint, run:

```
docker pull mysteriouscode/cfn-lint
```

If you want a specific version, run:

```
docker pull mysteriouscode/cfn-lint:v0.86.3
```

### From ECR 

Public ECR repository: https://gallery.ecr.aws/s4a2b7m4/cfn-lint

To get the latest release of cfn-lint, run:

```
docker pull public.ecr.aws/s4a2b7m4/cfn-lint:latest
```

If you want a specific version, run:

```
docker pull public.ecr.aws/s4a2b7m4/cfn-lint:v0.86.3
```


## Examples

In Jenkins Pipelines, you need to overwrite the entrypoint, as the cfn-lint's Dockerfile
does not follow the [official docker image consistency guidelines](https://github.com/docker-library/official-images#consistency):

```
docker.image('mysteriouscode/cfn-lint:latest').inside("--entrypoint=''") {
    sh "cfn-lint --info"
}
```


## Not sure if you can trust this repo?

We have created this repository as a public service, and all of it is publicly 
visible - you can check out the .github/workflows/ files to see the exact
steps that are used to build the docker image.

We also use this repository to store the CloudFormation template we use to authorise
GitHub access to the ECR repository - you can find it in cloudformation/ directory.