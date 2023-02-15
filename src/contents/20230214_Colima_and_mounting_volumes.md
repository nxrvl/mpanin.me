---
author: Maksim Panin
datetime: 2023-02-15 12:00:00
title: Colima and mounting volumes on MacOS
slug: colima-and-mounting-volumes
featured: true
draft: false
tags:
  - devops
  - colima
ogImage: ""
description:
---

# Colima and mounting volumes on MacOS

## Introduction:

When it comes to local development on MacOS, Docker Desktop has been a popular choice. However, due to issues with Docker Desktop on M1 and the speed of Colima, many users have switched to Colima. Unfortunately, Colima also has problems with mounting volumes using Docker-compose:

```shell
Error response from daemon: error while creating mount source path '<path>':
chown '<path>': operation not permitted
```

Solution for this problem using mount type 9p instead of default options.

## Steps to Resolve the Issue:

1. Delete the current settings and VM by running `colima delete`
2. Add the following settings to your Colima config file `/Users/<username>/.lima/_config/override.yaml`:

```yaml
mountType: 9p
mounts:
  - location: "/Users/<username>"
    writable: true
    9p:
      securityModel: mapped-xattr
      cache: mmap
  - location: "~"
    writable: true
    9p:
      securityModel: mapped-xattr
      cache: mmap
  - location: /tmp/colima
    writable: true
    9p:
      securityModel: mapped-xattr
      cache: mmap
```

3. Start Colima again with mount type 9p by running `colima start --mount-type 9p`

### Conclusion

The solution presented in this article has been tested on MacOS Ventura 13.1 and Colima version 0.5.2 using runtime: docker, arch: aarch64, client: v23.0.1, and server: v20.10.20. By following these steps, users can overcome the issues related to mounting volumes on MacOS while using Colima for local development.
