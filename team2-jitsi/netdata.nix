{ config, pkgs, lib, ... }:

{
  services.netdata.enable = true;
  networking.firewall.allowedTCPPorts = [ 19999 ];
  # environment.etc."netdata/health_alarm_notify.conf".source = "./netadata_health_alarm_notify.conf";

  ## Nginx upstream for reverse proxy to local netdata
  #services.nginx.upstreams = {
  #  netdata_gateway.servers."127.0.0.1:19999" = {};
  #  netdata_gateway.extraConfig = "keepalive 64;";
  #};

  ## Nginx reverse proxy config
  #services.nginx.virtualHosts."zt.project.zone".locations."/netdata" = {
  #  # basicAuthFile = "./netdata_htpasswd";
  #  proxyPass = "http://netdata_gateway";
  #  extraConfig = ''
  #    proxy_set_header X-Forwarded-Host $host;
  #    proxy_set_header X-Forwarded-Server $host;
  #    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  #    proxy_http_version 1.1;
  #    proxy_pass_request_headers on;
  #    proxy_set_header Connection "keep-alive";
  #    proxy_store off;
  #  '';
  #};
}
