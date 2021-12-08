{ config, pkgs, jitsi, ... }:


{
  networking.hostName = "meet";
  networking.domain = "cleeyv.tech";

  services.jitsi-meet = {
    enable = true;
    hostName = "meet.cleeyv.tech";
    jibri.enable = true;
  };

  services.jitsi-videobridge = {
    openFirewall = true;
    apis = [ "colibri" "rest" ];
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  security.acme.email = "cleeyv@riseup.net";
  security.acme.acceptTerms = true;
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Montreal";
}
