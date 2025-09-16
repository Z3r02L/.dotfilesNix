{ config, pkgs, nix-ai-tools, self, ... }:

let
  # unstable = pkgs.unstable;  # без кавычек
in
{
  # home.file.".config/nvim/init.lua".source = ./dotfiles/nvim/init.lua;

  home = {
    username = "zerg";
    homeDirectory = "/home/zerg";
    stateVersion = "25.05";
  };

  # ОБЯЗАТЕЛЬНО для standalone режима
  programs.home-manager.enable = true;

  imports = [
    ./packages.nix
    ./settings/librewolf.nix
    
    ./settings/shells/default.nix
  ];

  # Системная переменная для браузера по умолчанию (пример для xdg)
  # home.sessionVariables.BROWSER = "brave";
  # home.sessionVariables.XDG_DEFAULT_WEB_BROWSER = "brave.desktop";

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
