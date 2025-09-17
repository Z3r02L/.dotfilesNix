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

    # System utilities
    brightnessctl
    libnotify
    xdg-utils
    gammastep

    # VPN
    mullvad-vpn

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
  services.mullvad-vpn.enable = true;
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
