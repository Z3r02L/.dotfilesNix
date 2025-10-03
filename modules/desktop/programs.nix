{ config, lib, pkgs, ... }:
let
  # unstable = pkgs.unstable;
in
{
  # Programs
  programs.amnezia-vpn.enable = true;

  environment.systemPackages = with pkgs; [

    # Text editors
    vim
    neovim
    helix
    zed-editor-fhs

    wget
    curl
    git

    brave

    # File managers
    # xfce.thunar
    # xfce.tumbler

    # Communication
    signal-desktop
    telegram-desktop
    thunderbird

    # Graphics
    gimp3-with-plugins

    # KDE connect
    kdePackages.kdeconnect-kde

    # Productivity
    libreoffice
    obsidian
    anki-bin

    # System utilities
    xdg-utils
    brightnessctl
    libnotify
    gammastep

    # VPN
    amnezia-vpn
    v2rayn
    zapret

    # Others
    qbittorrent
    syncthing
    flatpak
  ];

  # system.activationScripts.setDefaultBrowser.text = ''
  #     #!/bin/sh
  #     xdg-settings set default-web-browser brave.desktop || true
  #     xdg-mime default brave.desktop x-scheme-handler/http
  #     xdg-mime default brave.desktop x-scheme-handler/https
  #     xdg-mime default brave.desktop text/html
  # '';

  services.resolved.enable = true;
  programs.kdeconnect.enable = true;

  systemd.user.services.kdeconnect = {
      description = "KDE Connect daemon";
      wantedBy = [ "default.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.kdePackages.kdeconnect-kde}/bin/kdeconnectd";
        Restart = "on-failure";
        RestartSec = 3;
      };
      environment = {
        # Ensure proper DBus session
        DISPLAY = ":0";
      };
    };

  # networking.firewall = {
  #   allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
  #   allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  # };

  # Enable flatpak
  services.flatpak.enable = true;
}
