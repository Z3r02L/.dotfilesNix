{ config, pkgs, ... }:
{
  networking = {
    firewall = {
      enable = true;
      allowedTCPPorts = [ 22 443 ]; # Только SSH
      allowedUDPPorts = [ ];
    };
  };

  # root-доступ по SSH
  # services.openssh.permitRootLogin = "no";
}
