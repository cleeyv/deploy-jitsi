Team 2 Jitsi Ops
================

Configuration for Team 2's Jitsi server.

It's currently using Serokell's [deploy.rs](https://github.com/serokell/deploy-rs) to deploy to the server at [https://zt.project.zone].

To deploy, make sure nix is installed with flakes enabled, clone the repo, `cd` into the directory, and run:

```
nix run github:serokell/deploy-rs .
```
