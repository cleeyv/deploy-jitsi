{ config, pkgs, ... }:

{
  services.jitsi-meet = {
    hostName = "zt.project.zone";
  };

  security.acme.email = "tshaynik@protonmail.com";
  security.acme.acceptTerms = true;
}
