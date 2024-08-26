# End of Life Ansible for CI

There are collections which still support Ansible/ansible-base/ansible-core versions that are End of Life in their CI. Sometimes challenges appear that make it hard to keep them running. This repository is an attempt to provide tools that make this easier.

## Supported EOL branches

The End of Life branches that this repository currently supports (in the sense that it *tries* to keep CI using these branches working as much as possible with the least amount of effort):

- `stable-2.9`:
  - ⚠ Note that the Fedora 31 image does not seem to work on GHA anymore.
  - Use alternative container images from this repository's container registry in OCI format.

- `stable-2.10`:
  - ⚠ Note that the Fedora 31 and Fedora 32 images do not seem to work on GHA anymore.
  - Use alternative container images from this repository's container registry in OCI format.
  - Cherry-picked [commit `Use git merge-base without --fork-point`](https://github.com/ansible/ansible/commit/9406242c8060beb6205219f65231f3fec28673d3) to fix change detection outside of AZP.

- `stable-2.11`:
  - ⚠ Note that the Ubuntu 20.04 image does not seem to work on GHA anymore.
  - Cherry-picked [commit `Use git merge-base without --fork-point`](https://github.com/ansible/ansible/commit/9406242c8060beb6205219f65231f3fec28673d3) to fix change detection outside of AZP.
  - Cherry-picked [commit `runtime-metadata sanity test: do not fail deprecation version checks if galaxy.yml has empty version`](https://github.com/ansible/ansible/commit/faf446a895590344e1563455edba05809401f9c8) to fix the runtime-metadata deprecation version test if `galaxy.yml`'s `version` is `null`.

- `stable-2.12`:
  - Cherry-picked [commit `runtime-metadata sanity test: do not fail deprecation version checks if galaxy.yml has empty version`](https://github.com/ansible/ansible/commit/faf446a895590344e1563455edba05809401f9c8) to fix the runtime-metadata deprecation version test if `galaxy.yml`'s `version` is `null`.

- `stable-2.13`:
  - Cherry-picked [commit `runtime-metadata sanity test: do not fail deprecation version checks if galaxy.yml has empty version`](https://github.com/ansible/ansible/commit/faf446a895590344e1563455edba05809401f9c8) to fix the runtime-metadata deprecation version test if `galaxy.yml`'s `version` is `null`.

- `stable-2.14`:
  - Cherry-picked [commit `runtime-metadata sanity test: do not fail deprecation version checks if galaxy.yml has empty version`](https://github.com/ansible/ansible/commit/faf446a895590344e1563455edba05809401f9c8) to fix the runtime-metadata deprecation version test if `galaxy.yml`'s `version` is `null`.

## Using this repository

If you are using the [`ansible-community/ansible-test-gh-action` GitHub action](https://github.com/ansible-community/ansible-test-gh-action), you can use the branches from this repository with the action's `ansible-core-github-repository-slug` option as follows:
```yaml
      - uses: ansible-community/ansible-test-gh-action@main
        with:
          ansible-core-github-repository-slug: ${{ contains(fromJson('["stable-2.9", "stable-2.10", "stable-2.11", "stable-2.12", "stable-2.13", "stable-2.14"]'), matrix.ansible) && 'ansible-community/eol-ansible' || 'ansible/ansible' }}
```
An example PR adding this change is [ansible-collections/community.internal_test_tools#124](https://github.com/ansible-collections/community.internal_test_tools/pull/124).

## CI container images

Some older CI images are available in deprecate image formats on quay.io that are no longer supported by newer Docker versions. The `copy-images.sh` script copies these images over to this repository's container registry in OCI format.
