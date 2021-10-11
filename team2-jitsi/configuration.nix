{ config, pkgs, jitsi, ... }:


{
  networking.hostName = "meet";
  #networking.domain = "cleeyv.tech";

  jitsi = {
    enable = true;
    hostName = "meet.cleeyv.tech";
  };

  #services.jitsi-meet.jibri.enable = true;

  services.jibri = {
    enable = true;

    xmppEnvironments."jitsi-meet" = {
      xmppServerHosts = [ "localhost" ];
      xmppDomain = config.jitsi.hostName;

      control.muc = {
        domain = "internal.${config.jitsi.hostName}";
        roomName = "JibriBrewery";
        nickname = "jibri";
      };

      control.login = {
        domain = "auth.${config.jitsi.hostName}";
        username = "jibri";
        passwordFile = "/var/lib/jitsi-meet/jibri-auth-secret";
      };

      call.login = {
        domain = "recorder.${config.jitsi.hostName}";
        username = "recorder";
        passwordFile = "/var/lib/jitsi-meet/jibri-recorder-secret";
      };

      usageTimeout = "0";
      disableCertificateVerification = true;
      stripFromRoomDomain = "conference.";
    };
  };

  security.acme.email = "cleeyv@riseup.net";
  security.acme.acceptTerms = true;
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Montreal";
}
