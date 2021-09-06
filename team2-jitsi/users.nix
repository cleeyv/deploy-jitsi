{ config, pkgs, ... }:

{
  users.users.tshaynik = {
    isNormalUser = true;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3wOOYiW+G1u5zHpvzq0N+nhj5l9o8lMht4kYias28n tshaynik"
    ];
  };
}
