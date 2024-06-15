#!/bin/bash
set -e

# Uncomment the container image to copy, and run this script to copy it.

SOURCE_REGISTRY_PATH=quay.io/ansible
DESTINATION_REPO=ansible-community/eol-ansible

function convert_image {
  echo "========================================================================================================="
  local IMAGE_NAME="$1"
  local DEST_PREFIX="$2"
  echo "FROM ${SOURCE_REGISTRY_PATH}/${IMAGE_NAME}" | podman build --annotation "org.opencontainers.image.source=https://github.com/${DESTINATION_REPO}" -t "ghcr.io/${DESTINATION_REPO}/${DEST_PREFIX}${IMAGE_NAME}" -
  podman push "ghcr.io/${DESTINATION_REPO}/${DEST_PREFIX}${IMAGE_NAME}"
  podman rmi "${SOURCE_REGISTRY_PATH}/${IMAGE_NAME}"
  podman rmi "ghcr.io/${DESTINATION_REPO}/${DEST_PREFIX}${IMAGE_NAME}"
}

# Ansible 2.9
#convert_image default-test-container:1.10.1 ansible-2.9-
#convert_image centos6-test-container:1.26.0 ansible-2.9-
#convert_image centos7-test-container:1.8.0 ansible-2.9-
#convert_image centos8-test-container:1.10.0 ansible-2.9-
#convert_image fedora30-test-container:1.9.2 ansible-2.9-
#convert_image fedora31-test-container:1.11.0 ansible-2.9-
#convert_image opensuse15py2-test-container:1.21.0 ansible-2.9-
#convert_image opensuse15-test-container:1.21.0 ansible-2.9-
#convert_image ubuntu1604-test-container:1.8.0 ansible-2.9-
#convert_image ubuntu1804-test-container:1.8.0 ansible-2.9-

# ansible-base 2.10
#convert_image default-test-container:2.9.0 ansible-2.10-
#convert_image ansible-base-test-container:1.7.0 ansible-2.10-
#convert_image centos6-test-container:1.26.0 ansible-2.10-
#convert_image centos7-test-container:1.17.0 ansible-2.10-
#convert_image centos8-test-container:1.21.0 ansible-2.10-
#convert_image fedora30-test-container:1.17.0 ansible-2.10-
#convert_image fedora31-test-container:1.17.0 ansible-2.10-
#convert_image fedora32-test-container:1.17.0 ansible-2.10-
#convert_image opensuse15py2-test-container:1.21.0 ansible-2.10-
#convert_image opensuse15-test-container:1.21.0 ansible-2.10-
#convert_image ubuntu1604-test-container:1.21.0 ansible-2.10-
#convert_image ubuntu1804-test-container:1.21.0 ansible-2.10-
#convert_image ubuntu2004-test-container:1.21.0 ansible-2.10-

# Generic
#convert_image http-test-container:1.0.0 generic-
#convert_image pypi-test-container:1.0.0 generic-
#convert_image cloudstack-test-container:1.2.0 generic-
#convert_image openshift-origin:v3.9.0 generic-
#convert_image acme-test-container:2.0.0 generic-
#convert_image nios-test-container:1.3.0 generic-
#convert_image vcenter-test-container:1.7.0 generic-
#convert_image fallaxy-test-container:1.0.0 generic-
#convert_image fallaxy-test-container:2.0.1 generic-
#convert_image foreman-test-container:1.4.0 generic-
