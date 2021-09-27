{ config, pkgs, jitsi, ... }:


{
  networking.hostName = "meet";
  networking.domain = "cleeyv.tech";

  jitsi = {
    enable = true;
    hostName = "meet.cleeyv.tech";
  };

  services.jitsi-meet.jibri.enable = true;

  security.acme.email = "cleeyv@riseup.net";
  security.acme.acceptTerms = true;
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Montreal";
}
