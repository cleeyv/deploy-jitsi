{ config, pkgs, jitsi, ... }:


{
  networking.hostName = "zt";
  networking.domain = "project.zone";

  jitsi = {
    enable = true;
    hostName = "zt.project.zone";
  };

  security.acme.email = "tshaynik@protonmail.com";
  security.acme.acceptTerms = true;
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Montreal";
}
