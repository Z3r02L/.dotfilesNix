{ config, pkgs, ... }: {
  imports = [
    ../../modules/networking.nix
    # ../../modules/security.nix
    ../../roles/workstation.nix
    ../../users/alice.nix
    ../../home/alice/default.nix
    ./hardware-configuration.nix
  ];

  networking.hostName = "laptop";
}
