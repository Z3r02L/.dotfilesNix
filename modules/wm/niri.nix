{ config, pkgs, ... }:
let
  # unstable = pkgs.unstable; # Already passed as special arg
in
{
  # --- Добавляем KDE Plasma 6 и Hyprland ---

  # 1. Включаем окружение рабочего стола KDE Plasma 6
  # Plasma 6 уже доступна в стабильной версии NixOS
  # 2. Включаем VM
  programs.niri.enable = true;

  # 3. Включаем менеджер входа SDDM
  services.displayManager.sddm = {
    wayland.enable = true;
    enable = true;
  };

  # Необходимые порталы для скриншотов, шаринга экрана и т.д.
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  security.polkit.enable = true; # polkit
  services.gnome.gnome-keyring.enable = true; # secret service
  security.pam.services.swaylock = {};
  programs.waybar.enable = true; # top bar

  # По умолчанию конфиг Hyprland пытается запустить терминал kitty
  environment.systemPackages = with pkgs; [
    alacritty kitty
    fuzzel
    swaylock
    mako
    swayidle

    xwayland-satellite
  ];
}
