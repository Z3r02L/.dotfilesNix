{ config, pkgs, nix-ai-tools, ... }:
let
  # pkgs.system = "x86_64-linux";
  # unstable = pkgs.unstable;
in
{
  imports = [

  ];

  programs.xdg.enable = true;

  packages = with pkgs; [
    vim
    neovim # важный редактор для конфигурации
    helix
    wget
    curl
    git
    lazygit
    lazyjj
    yazi
    zed-editor-fhs
    telegram-desktop
  ];
}
