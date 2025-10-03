{ config, pkgs, ... }:
let
  # unstable = pkgs.unstable; # Already passed as special arg
in
{
  # --- Убираем GNOME ---
  # Закомментируй или удали эти строки, чтобы отключить GNOME и его менеджер входа GDM
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # --- Добавляем KDE Plasma 6 и Hyprland ---

  # 1. Включаем окружение рабочего стола KDE Plasma 6
  # Plasma 6 уже доступна в стабильной версии NixOS
  services.desktopManager.plasma6.enable = true;

  # 2. Включаем VM
  programs.hyprland.enable = true;

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

  # 5. (Важно!) Устанавливаем терминал для Hyprland
  # По умолчанию конфиг Hyprland пытается запустить терминал kitty
  environment.systemPackages = with pkgs; [
    kdePackages.karousel
    kitty
    alacritty
    xwayland-satellite
  ];
}
