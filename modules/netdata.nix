{ config, pkgs, lib, ... }:

{
  services.netdata.enable = true;

  # Nginx upstream for reverse proxy to local netdata
  services.nginx.upstreams = {
    netdata_meet.servers."127.0.0.1:19999" = { };
    netdata_meet.extraConfig = "keepalive 64;";
  };

  # Nginx reverse proxy config
  services.nginx.virtualHosts."data.meet.cleeyv.tech" = {
    enableACME = true;
    forceSSL = true;
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

