{ config, pkgs, jitsi, ... }:

{
  jitsi = {
    enable = true;
    hostName = "zt.project.zone";
  };

  security.acme.email = "tshaynik@protonmail.com";
  security.acme.acceptTerms = true;
}
