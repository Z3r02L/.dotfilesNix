{ config, pkgs, pkgs-unstable, nix-ai-tools, ... }:
let
  # pkgs.system = "x86_64-linux";
  unstable = pkgs-unstable;
in
{
  imports = [

  ];

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
