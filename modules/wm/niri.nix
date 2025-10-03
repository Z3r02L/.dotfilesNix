{ config, pkgs, ... }:
let
  # Создаем специальный скрипт для запуска Niri с поддержкой NVIDIA
  niri-session-nvidia = pkgs.writeShellScriptBin "niri-session-nvidia" ''
    # Устанавливаем переменные окружения для NVIDIA
    export WLR_NO_HARDWARE_CURSORS=1
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export GBM_BACKEND=nvidia-drm
    export LIBVA_DRIVER_NAME=nvidia
    export EGL_PLATFORM=wayland
    export WLR_RENDERER=vulkan
    
    # Запускаем Niri с сессионными параметрами
    exec ${pkgs.niri}/bin/niri --session
  '';
  
  # Создаем файл сессии для SDDM
  niri-desktop = pkgs.writeTextDir "share/wayland-sessions/niri-nvidia.desktop" ''
    [Desktop Entry]
    Name=Niri (NVIDIA)
    Comment=A scrollable-tiling Wayland compositor with NVIDIA support
    Exec=${niri-session-nvidia}/bin/niri-session-nvidia
    Type=Application
    DesktopNames=niri
  '';
in
{
  # --- Добавляем KDE Plasma 6 и Niri ---

  # 1. Включаем окружение рабочего стола KDE Plasma 6
  # Plasma 6 уже доступна в стабильной версии NixOS
  # 2. Включаем Niri с поддержкой NVIDIA
  programs.niri = {
    enable = true;
    # Добавляем пакет niri из niri-flake для лучшей поддержки
    package = pkgs.niri;
  };

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
  # programs.waybar.enable = true; # top bar

  # По умолчанию конфиг Niri пытается запустить терминал kitty
  environment.systemPackages = with pkgs; [
    alacritty kitty
    fuzzel
    swaylock
    mako
    swayidle
    xwayland-satellite
    
    # Добавляем наш специальный скрипт и файл сессии
    niri-session-nvidia
    niri-desktop
  ];

  # Специальные настройки для NVIDIA
  environment.variables = {
    # Устанавливаем переменные для корректной работы с NVIDIA
    WLR_NO_HARDWARE_CURSORS = "1"; # Исправляет проблемы с курсором на NVIDIA
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_RENDERER = "vulkan"; # Используем vulkan рендерер
  };

  # Обеспечиваем корректную работу с NVIDIA DRM
  boot.kernelParams = [ "nvidia-drm.modeset=1" "nvidia-drm.fbdev=1" ];
}
