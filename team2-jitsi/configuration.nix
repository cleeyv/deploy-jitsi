{ config, pkgs, ... }:

{
  services.jitsi-meet = {
    enable = true;
    hostName = "zt.project.zone";
  };

  services.jitsi-videobridge.openFirewall = true;
  networking.firewall.allowedTCPPorts = [ 80 443 ];
  security.acme.email = "tshaynik@protonmail.com";
  security.acme.acceptTerms = true;
}
