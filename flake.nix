{
  description = "Deployment for Team 2's jitsi server";

  # For accessing `deploy-rs`'s utility Nix functions
  inputs.deploy-rs.url = "github:serokell/deploy-rs";
  inputs.jitsi.url = "github:ngi-nix/jitsi";
  # inputs.nixpkgs.url = "github:cleeyv/nixpkgs/jibri";
  inputs.nixpkgs.url = "git+file:///home/cleeyv/dev/nixpkgs";
  inputs.stable.url = "github:nixos/nixpkgs/nixos-21.05";

  outputs = { self, nixpkgs, deploy-rs, jitsi, stable }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; overlays = [ (self: super: { pkgs.chromium = stable.chromium; }) ]; };
    in
    rec {
      nixosConfigurations = {
        #system = "x86_64-linux";
        team2-jitsi = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            jitsi.nixosModules.jitsi
            ./team2-jitsi/configuration.nix
            ./team2-jitsi/users.nix
            ./team2-jitsi/digitalocean.nix
            ./team2-jitsi/monitoring.nix
            ./team2-jitsi/netdata.nix
            { nixpkgs = { inherit pkgs; }; }
          ];
          specialArgs = { inherit self; };
        };

        team2-jibri = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            jitsi.nixosModules.jitsi
            ./team2-jibri/configuration.nix
            ./team2-jitsi/users.nix
            ./team2-jitsi/digitalocean.nix
          ];
          specialArgs = { inherit self; };
        };
      };

      deploy.nodes = {
        team2-jitsi = {
          hostname = "meet.cleeyv.tech";
          profiles.system = {
            user = "root";
            sshUser = "root";
            path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.team2-jitsi;
          };
        };
        team2-jibri = {
          hostname = "record.cleeyv.tech";
          profiles.system = {
            user = "root";
            sshUser = "root";
            path = deploy-rs.lib.x86_64-linux.activate.nixos self.nixosConfigurations.team2-jibri;
          };
        };
      };

      # This is highly advised, and will prevent many possible mistakes
      checks = builtins.mapAttrs (system: deployLib: deployLib.deployChecks self.deploy) deploy-rs.lib;
    };
}
