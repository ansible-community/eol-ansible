# End of Life Ansible for CI

There are collections which still support Ansible/ansible-base/ansible-core versions that are End of Life in their CI. Sometimes challenges appear that make it hard to keep them running. This repository is an attempt to provide tools that make this easier.

## Using this repository

TODO

## CI container images

Some older CI images are available in deprecate image formats on quay.io that are no longer supported by newer Docker versions. The `copy-images.sh` script copies these images over to this repository's container registry in OCI format.
