Team 2 Jitsi Ops
================

Configuration for Team 2's Jitsi server.

It's currently using Serokell's [deploy.rs](https://github.com/serokell/deploy-rs) to deploy to the server at [https://zt.project.zone].

To deploy, make sure nix is installed with flakes enabled, clone the repo, `cd` into the directory, and run:

```
nix run github:serokell/deploy-rs .
```

## Jitsi configuration

All Jitsi configuration that is not directly related to this specific instance
can be found and modified at [https://www.github.com/ngi-nix/jitsi].

Those changes to the Jitsi metaflake repo can be deployed to [https://zt.project.zone] by update
the flake dependencies in this repository and then running deploy-rs.


```
nix flake update
nix run github:serokell/deploy-rs .
```
