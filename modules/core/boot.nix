{ config, pkgs, ... }:

{
  boot.kernelPackages = pkgs.linuxPackages_6_16;
  
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
}
