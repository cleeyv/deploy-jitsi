{ config, pkgs, jitsi, ... }:

{
  imports =
    [
      ./jibri-module.nix
    ];


  networking.hostName = "record";
  networking.domain = "cleeyv.tech";

  environment.systemPackages = with pkgs; [ jibri xorg.xf86videodummy ];
  services.jibri.enable = true;

  #jitsi = {
  #  enable = true;
  #  hostName = "meet.cleeyv.tech";
  #};

  security.acme.email = "cleeyv@riseup.net";
  security.acme.acceptTerms = true;
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Montreal";
}
