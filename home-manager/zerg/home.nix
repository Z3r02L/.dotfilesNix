{ config, pkgs, pkgs-unstable, nix-ai-tools, ... }:

let
  unstable = pkgs-unstable;  # без кавычек
in
{
  home = {
    username = "zerg";
    homeDirectory = "/home/zerg";
    stateVersion = "25.05";
  };

  # ОБЯЗАТЕЛЬНО для standalone режима
  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
  ];

  # Синхронизация файлов
  # home.file.".config/".source = ./config;
  # home.file.".local/share/".source = ./share;

  # Системные службы для пользователя
  systemd.user = {
    services = {
      # Добавить пользовательские сервисы
    };
  };

}
