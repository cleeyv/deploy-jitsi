{ config, pkgs, lib, ... }:

{
  services.netdata.enable = true;
  # To enable monitoring notifications 
  # environment.etc."netdata/health_alarm_notify.conf".source = "./netadata_health_alarm_notify.conf";

  # Nginx upstream for reverse proxy to local netdata
  services.nginx.upstreams = {
    netdata_meet.servers."127.0.0.1:19999" = { };
    netdata_meet.extraConfig = "keepalive 64;";
  };

  # Nginx reverse proxy config
  services.nginx.virtualHosts."data.meet.cleeyv.tech" = {
    enableACME = true;
    forceSSL = true;
    # To require login to view the dashboard
    # basicAuthFile = "./netdata_htpasswd";
    locations."/" = {
      proxyPass = "http://netdata_meet";
      extraConfig = ''
        proxy_set_header X-Forwarded-Host $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_http_version 1.1;
        proxy_pass_request_headers on;
        proxy_set_header Connection "keep-alive";
        proxy_store off;
      '';
    };
  };
}

