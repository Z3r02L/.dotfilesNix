{ config, pkgs, ... }:
{

  # AMD CPU optimisations
  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  # Kernel / Ядро
  boot.kernelPackages = pkgs.linuxPackages_6_16;

  # Kernel optimisation / Оптимизация ядра
  boot.kernel.sysctl = {
    "vm.swappiness" = 60;
    "vm.vfs_cache_pressure" = 50;
    "net.core.rmem_max" = 16777216;
    "net.core.wmem_max" = 16777216;
  };

  # File system optimisation / Оптимизация файловой системы
  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/e8479d40-2038-4c25-aa80-8b178313b8b2";
      fsType = "btrfs";
      options = [ "compress=zstd" "noatime" ];
    };
  };

  # Enable zram swap
  zramSwap.enable = true;

}

