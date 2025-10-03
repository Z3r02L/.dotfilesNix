{ pkgs, config, ... }:
{
  # hardware.opengl has beed changed to hardware.graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Включаем проприетарные драйверы NVIDIA
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    # Это самый важный параметр для Wayland!
    powerManagement.enable = false; # Отключаем управление питанием, чтобы избежать проблем
    open = false; # Используем проприетарный драйвер
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Загружаем модуль ядра nvidia
  boot.kernelModules = ["nvidia"];

  # Добавляем параметр ядра для включения DRM/KMS
  boot.kernelParams = ["nvidia-drm.modeset=1"];

  # Черный список для nouveau, чтобы он не конфликтовал
  boot.blacklistedKernelModules = [ "nouveau" "rivafb" "nvidiafb" ];

  powerManagement.enable = false;
  
}
