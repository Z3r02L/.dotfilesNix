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

  # 2. Включаем VM
  programs.hyprland.enable = true;

  # 3. Включаем менеджер входа SDDM
  services.displayManager.sddm = {
    wayland.enable = true;
    enable = true;
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
