# Another awscli

[![](https://travis-ci.org/wenlock/docker-awscli.svg?branch=master)](https://travis-ci.org/wenlock/docker-awscli)

Lets build another aws cli tool for docker so we can hack. :tada:

## Using the image
Here is some instructions on how to use it.

### Setup a function
This works in bash

```bash
  function aws {
      export AWS_CLI_IMAGE="${AWS_CLI_IMAGE:-wenlock/awscli}"
      docker run -it --rm -e AWS_ACCESS_KEY_ID \
                                       -e AWS_SECRET_ACCESS_KEY \
                                       -e AWS_DEFAULT_REGION \
                                       ${AWS_CLI_IMAGE} aws $@
  }
```

Don't like the `latest` version, just set `export AWS_CLI_IMAGE=wenlock/awscli:1.11.189`.
We'll get the aws version you ask for.

### Using Contributed Scripts

We also have contributed scripts from `./contrib/linux` folder that can
be installed on a target system to enable using the container easier.

Simply copy the `contrib/[platform]` script to the location in your path, and
start using `aws`.  Example Dockerfile for how to include this into a dind image might look like:

```
FROM wenlock/awscli:1.15.21 as awscli
FROM dind
COPY --from=awscli /contrib/linux /usr/local/bin/aws
```

### Setup credentials with environment vars

```bash
export AWS_ACCESS_KEY_ID=aaaabbbbbb
export AWS_SECRET_ACCESS_KEY=xxxxxxxxxx
export AWS_DEFAULT_REGION=us-east-1
```

### Use it

For example:

`eval $(aws ecr get-login)`

## Contributing to awscli

Want to help me, wow cool!  

Fork this repo and submit a PR :D


## Licensing
[MIT](LICENSE.txt)
