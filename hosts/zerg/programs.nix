{ config, pkgs, nix-ai-tools, ... }:
let
  # pkgs.system = "x86_64-linux";
  unstable = pkgs.unstable;
in
{
  imports = [

  ];

  programs.xdg.enable = true;

  packages = with pkgs; [
    vim                # важный редактор для конфигурации
    wget
    curl
    git
    lazygit
    lazyjj
    yazi
    unstable.zed-editor-fhs
    telegram-desktop
  ];
}
