{ config, pkgs, ... }:
{

  # Добавить оптимизации для AMD CPU
  hardware.cpu.amd.updateMicrocode = true;
  hardware.enableRedistributableFirmware = true;

  # Оптимизация ядра
  # boot.kernel.sysctl = {
  #   "vm.swappiness" = 60;
  #   "vm.vfs_cache_pressure" = 50;
  #   "net.core.rmem_max" = 16777216;
  #   "net.core.wmem_max" = 16777216;
  # };

  # Оптимизация файловой системы
  # fileSystems = {
  #   "/" = {
  #     device = "/dev/disk/by-uuid/e8479d40-2038-4c25-aa80-8b178313b8b2";
  #     fsType = "btrfs";
  #     options = [ "compress=zstd" "noatime" ];
  #   };
  # };

  # Включить zram swap
  # zramSwap.enable = true;
}
