{ config, pkgs, lib, ... }: {
  imports = [

    ./users/zerg.nix

    ../../modules/core/default.nix
    ../../modules/roles/workstation.nix
    ../../modules/games/default.nix
    # ../../home-manager/zerg/home.nix

    ./hardware-configuration.nix
  ];

  networking.hostName = "zerg";

  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
