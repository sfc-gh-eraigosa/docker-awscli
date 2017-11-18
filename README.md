# Another awscli

![](https://travis-ci.org/wenlock/docker-awscli.svg?branch=master)

Lets build another aws cli tool for docker so we can hack. :tada:

## Using the image
Here is some instructions on how to use it.

### Setup a function
This works in bash

```bash
  function awscli {
      export AWS_CLI_IMAGE="${AWS_CLI_IMAGE:-wenlock/awscli}"
      docker run -it --rm -e AWS_ACCESS_KEY_ID \
                                       -e AWS_SECRET_ACCESS_KEY \
                                       -e AWS_DEFAULT_REGION \
                                       ${AWS_CLI_IMAGE} aws $@
  }
```

Don't like the `latest` version, just set `export AWS_CLI_IMAGE=wenlock/awscli:1.11.189`.
We'll get the aws version you ask for.

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
