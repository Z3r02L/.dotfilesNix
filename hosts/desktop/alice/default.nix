{ config, pkgs, ... }:
{
  # Пример интеграции home-manager
  home.username = "alice";
  home.homeDirectory = "/home/alice";
  imports = [ ./programs.nix ];
}
