{ config, pkgs, ... }:

{
  services.prometheus = {
    enable = true;

    exporters = {
      node = {
        enable = true;
        enabledCollectors = [ "systemd" ];
      };
      jitsi = {
        enable = true;
      };
    };

    scrapeConfigs = [
      {
        job_name = "metrics-node";
        static_configs = [{
          targets = [ "127.0.0.1:${toString config.services.prometheus.exporters.node.port}" ];
        }];
      }
      {
        job_name = "metrics-jitsi";
        static_configs = [{
          targets = [ "127.0.0.1:${toString config.services.prometheus.exporters.jitsi.port}" ];
        }];
      }
    ];

  };

  services.grafana = {
    enable = true;
    domain = "metrics.meet.cleeyv.tech";
    port = 2342;
    addr = "127.0.0.1";
  };
  
  # nginx reverse proxy
  services.nginx.virtualHosts.${config.services.grafana.domain} = {
    forceSSL = true;
    enableACME = true;

    locations."/" = {
        proxyPass = "http://127.0.0.1:${toString config.services.grafana.port}";
        proxyWebsockets = true;
    };
  };
}
