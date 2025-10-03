{ config, pkgs, lib, ... }: {
  imports = [

    ./users/zerg.nix
    ./performance.nix

    ../../modules/core/default.nix
    ../../modules/wm/niri.nix
    ../../modules/wm/KDEplasma6.nix
    ../../modules/wm/hyprland.nix
    ../../modules/desktop/stylix/stylix.nix
    ../../modules/games/default.nix
    ../../modules/cli-tui/default.nix
    # ../../home-manager/zerg/home.nix

    ./hardware-configuration.nix
  ];

  networking.hostName = "zerg";

  system.stateVersion = "25.05"; # Did you read the comment?

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
}
