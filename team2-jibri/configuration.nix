{ config, pkgs, jitsi, ... }:

{
  networking.hostName = "record";
  networking.domain = "cleeyv.tech";

  environment.systemPackages = with pkgs; [ jibri ];
  services.jibri.enable = true;

  security.acme.email = "cleeyv@riseup.net";
  security.acme.acceptTerms = true;
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Montreal";
}
