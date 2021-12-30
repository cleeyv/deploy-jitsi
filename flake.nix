{
  description = "Deployment for a Jitsi server on NixOS";

  # For accessing `deploy-rs`'s utility Nix functions
  inputs.deploy-rs.url = "github:serokell/deploy-rs";
  inputs.nixpkgs.url = "github:cleeyv/nixpkgs/backport-chromium";

  outputs = { self, nixpkgs, deploy-rs}: rec {
    nixosConfigurations.deploy-jitsi = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./modules/configuration.nix
        ./modules/users.nix
        ./modules/digitalocean.nix
        ./modules/monitoring.nix
        ./modules/netdata.nix
      ];
      specialArgs = { inherit self; };
    };

    deploy.nodes.deploy-jitsi = {
      hostname = "meet.cleeyv.tech";
      profiles.system = {
        user = "root";
        sshUser = "root";
        path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.deploy-jitsi;
      };
    };

    # This is highly advised, and will prevent many possible mistakes
    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
  };
}
