{
  description = "Deployment for Team 2's jitsi server";

  # For accessing `deploy-rs`'s utility Nix functions
  inputs.deploy-rs.url = "github:serokell/deploy-rs";
  inputs.jitsi.url = "github:ngi-nix/jitsi";

  outputs = { self, nixpkgs, deploy-rs, jitsi }: rec {
    nixosConfigurations.team2-jitsi = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [ 
        jitsi.nixosModules.jitsi
        ./team2-jitsi/configuration.nix
        ./team2-jitsi/users.nix
        ./team2-jitsi/digitalocean.nix
      ];
      specialArgs = { inherit self; };
    };

    deploy.nodes.team2-jitsi = {
      hostname = "zt.project.zone";
      profiles.system = {
        user = "root";
        sshUser = "root";
        path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.team2-jitsi;
      };
    };

    # This is highly advised, and will prevent many possible mistakes
    checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
  };
}
