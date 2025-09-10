{ config, pkgs, lib, ... }: {
  imports = [
    ../../modules/core/default.nix
    ../../roles/workstation.nix
    ../../users/zerg.nix
    # ../../home-manager/zerg/home.nix

    ./hardware-configuration.nix
  ];

  networking.hostName = "zerg";

  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
