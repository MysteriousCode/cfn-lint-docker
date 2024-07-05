# cfn-lint-docker

[![Build docker image](https://github.com/MysteriousCode/cfn-lint-docker/actions/workflows/docker.yaml/badge.svg?branch=main)](https://github.com/MysteriousCode/cfn-lint-docker/actions/workflows/docker.yaml)

This repository was created to automatically build and publish public docker images for 
[aws-cloudformation/cfn-lint](https://github.com/aws-cloudformation/cfn-lint).

Since there's no official docker repository for [cfn-lint](https://github.com/aws-cloudformation/cfn-lint)
we have decided to create this repo and use GitHub Actions to automatically
build a new docker image for each cfn-lint [release](https://github.com/aws-cloudformation/cfn-lint/releases).

The GitHub Actions in this repo are triggered each day to check if a new release
of cfn-lint is available, so we can always have up-to-date docker image available!

## Where to get it

The images are published to a public ECR and Docker Hub repositories.
From there, use cfn-lint as usual - we simply build cfn-lint from their repository, see [Dockerfile](Dockerfile).

### From Docker Hub

Docker Hub repository: https://hub.docker.com/r/mysteriouscode/cfn-lint

To get the latest release of cfn-lint, run:

```
docker pull mysteriouscode/cfn-lint
```

If you want a specific version, run:

```
docker pull mysteriouscode/cfn-lint:v0.87.9
```

You can also use major versions:

```
docker pull mysteriouscode/cfn-lint:v1
```

### From ECR 

Public ECR repository: https://gallery.ecr.aws/mysteriouscode/cfn-lint

To get the latest release of cfn-lint, run:

```
docker pull public.ecr.aws/mysteriouscode/cfn-lint:latest
```

If you want a specific version, run:

```
docker pull public.ecr.aws/mysteriouscode/cfn-lint:v0.87.9
```

You can also use major versions:

```
docker pull public.ecr.aws/mysteriouscode/cfn-lint:v1
```

## Usage

Most CI environments mount your code into the container automatically and correctly set the workdir, so all you need
 to so is run `cfn-lint`. We use `--info` argument in the examples below to print out a little more information on what
`cfn-lint` is doing.

### Jenkins Pipelines

```
docker.image('mysteriouscode/cfn-lint:latest') {
    sh "cfn-lint --info"
}
```

### GitLab CI

```
lint:
  image:
    name: mysteriouscode/cfn-lint:latest
  script:
    - cfn-lint --info
```

### Command line

Mount your files using `-v` to any directory inside the container (we're using `/data` in this example) and set the
workdir (`-w` or `--workdir`) to that directory:

```
docker run -v `pwd`:/data -w /data mysteriouscode/cfn-lint:v0 cfn-lint --info
```


## Not sure if you can trust this repo?

We have created this repository as a public service, and all of it is publicly 
visible - you can check out the `.github/workflows/` files to see the exact
steps that are used to build the docker image.

We also use this repository to store the CloudFormation template we use to authorise
GitHub access to the ECR repository - you can find it in `cloudformation/` directory.

All commits in this repo are signed with GPG keys, see 
[GitHub's documentation on signed commits](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification).