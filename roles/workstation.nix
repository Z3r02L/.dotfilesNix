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
  
  # 2. Включаем оконный менеджер Hyprland
  # Этот модуль добавит опцию для запуска Hyprland на экране входа
  programs.hyprland.enable = true;

  # 3. Включаем менеджер входа SDDM
  # Он отлично работает с Plasma и автоматически найдет сессию Hyprland
  services.displayManager.sddm.enable = true;

  # 4. (Рекомендуется) Включаем Wayland-режим для самого экрана входа
  # Это сделает всю систему более консистентной
  services.displayManager.sddm.wayland.enable = true;

  # 5. (Важно!) Устанавливаем терминал для Hyprland
  # По умолчанию конфиг Hyprland пытается запустить терминал kitty
  environment.systemPackages = with pkgs; [
    kitty
    alacritty
  ];
}
