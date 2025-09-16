{ config, lib, pkgs, ... }:
let
  # unstable = pkgs.unstable;
in
{
  # Programs
  programs.amnezia-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    xdg-utils
    amnezia-vpn
    v2rayn
    zapret
    vim
    neovim
    wget
    curl
    git
    brave

    zed-editor-fhs
  ];

  # system.activationScripts.setDefaultBrowser.text = ''
  #     #!/bin/sh
  #     xdg-settings set default-web-browser brave.desktop || true
  #     xdg-mime default brave.desktop x-scheme-handler/http
  #     xdg-mime default brave.desktop x-scheme-handler/https
  #     xdg-mime default brave.desktop text/html
  # '';
}
