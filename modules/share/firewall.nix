{ config, lib, pkgs, ... }:

{
  networking.firewall = {
    allowedTCPPorts = [ 22 443 80 ];
    allowedUDPPorts = [ ];
    # enable = false; # Uncomment to disable firewall
  };
}
