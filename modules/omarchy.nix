{ config, pkgs, lib, omarchy-nix, ... }:

{
  # Импортируем модуль omarchy-nix
  imports = [ omarchy-nix.nixosModules.default ];

  # Конфигурация omarchy
  omarchy = {
    full_name = "Zerg User";
    email_address = "zerg@example.com";
    theme = "tokyo-night";
    # Вы можете изменить тему на одну из следующих:
    # "kanagawa", "everforest", "catppuccin", "nord", "gruvbox", "gruvbox-light"
    # Или использовать сгенерированную тему:
    # theme = "generated_dark"; # или "generated_light"
    # theme_overrides = {
    #   wallpaper_path = ./path/to/your/wallpaper.png;
    # };
    
    # Дополнительные параметры настройки
    primary_font = "Liberation Sans 11";
    scale = 1; # Масштаб отображения (1 для 1x дисплеев, 2 для 2x дисплеев)
    
    # Настройка мониторов (при необходимости)
    # monitors = [
    #   "DP-1,1920x1080@60,0x0,1"
    #   "HDMI-1,1920x1080@60,1920x0,1"
    # ];
    
    # Настройка быстрых клавиш для запуска приложений
    # quick_app_bindings = [
    #   "SUPER, return, exec, $terminal"
    #   "SUPER, F, exec, $fileManager"
    #   "SUPER, B, exec, $browser"
    #   "SUPER, N, exec, $terminal -e nvim"
    # ];
    
    # Исключение пакетов из стандартной установки (при необходимости)
    # exclude_packages = [ pkgs.some-package ];
  };
}
