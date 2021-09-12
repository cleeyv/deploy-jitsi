{ config, pkgs, ... }:

{
  users.users.tshaynik = {

    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO3wOOYiW+G1u5zHpvzq0N+nhj5l9o8lMht4kYias28n tshaynik"
    ];
  };
  users.users.tomberek = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDSF4CzkvONzaze5m0huhLmED9fxQTtuyv7rszWI0ju/+U4Gq4+Sd800vFrADfnbiLS4hgK4pDw5D8dXxi74mPeXXZV4oomafCnlvW7tL7RidEXvkP2sr1ObgkuQ9K67hSqKjT21mCWdEN6WGHh9EtK5r3nXIzUWhATqDz/Al7sveDZ/gdapo+f3xnmpOu1mq+y5iOcRV7b98z/VaiWAvuG83toIBsK4Su/GWWfMNied9R2K2Z10NM3ART0Sk+4yqH4usJOieTQsLAq8Ykb3PAYDMVx41yy9QNcFnCyX/HJHFO/Q98BLQ2zPxVbBMwp99NrKLqrwkrVtrWbAttanm9 cardno:000607658414"
    ];
  };
  users.users.cleeyv = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO4p4CqilI3n1GOyGcDgUh1UpwxeHSTIiV4oeHYjF431 cleeyv"
    ];
  };
  users.users.pallatinus = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL92OWtDtjXDHgv59e1qIltlS1qJQBZ/mjuF3h1YkrFd pallatinus"
    ];
  };
}
