# home-manager/zerg/settings/zsh.nix
{ config, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh"; # Указываем директорию для конфигов Zsh

    # Базовые настройки Zsh
    shellAliases = {
      ll = "ls -la";
      update = "sudo nixos-rebuild switch --flake ~/.dotfilesNix/#zerg && home-manager switch --flake ~/.dotfilesNix/#zerg";
      g = "git";
      gst = "git status";
      gco = "git checkout";
      gbr = "git branch";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push";
      gl = "git pull";
    };

    # Автодополнение
    enableCompletion = true;
    completionInit = ''
      autoload -Uz compinit
      compinit
    '';

    # История команд
    history = {
      expireDuplicates = true;
      extended = true;
      share = true;
      size = 10000;
    };

    # Плагины (примеры)
    plugins = [
      {
        name = "zsh-syntax-highlighting";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-syntax-highlighting";
          rev = "0.7.1";
          sha256 = "sha256-R4X1wIu87YhHh3w9n9r5/vX/L50Q7u2w+1+0k6y0g/g="; # Обновите SHA256
        };
      }
      {
        name = "zsh-autosuggestions";
        src = pkgs.fetchFromGitHub {
          owner = "zsh-users";
          repo = "zsh-autosuggestions";
          rev = "v0.7.0";
          sha256 = "sha256-Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q3Q="; # Обновите SHA256
        };
      }
    ];

    # Инициализация Zsh
    initExtra = ''
      # Пользовательские настройки Zsh
      export EDITOR="nvim"
      # source ~/.config/zsh/.zshrc # Если у вас есть отдельный .zshrc
    '';
  };
}
