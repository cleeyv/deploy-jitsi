Deploy Jitsi
=============

Deployment and configuration for a Jitsi server on NixOS.

It's currently using Serokell's [deploy.rs](https://github.com/serokell/deploy-rs) to deploy to the server at [https://meet.cleeyv.tech].

To deploy, make sure nix is installed with flakes enabled, clone the repo, `cd` into the directory, and run:

```
nix run github:serokell/deploy-rs .
```
