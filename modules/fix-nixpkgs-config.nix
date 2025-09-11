{ config, pkgs, lib, ... }:

{
  # Исправляем конфликт с nixpkgs.config
  nixpkgs.config = lib.mkForce {
    allowUnfree = true;
    # Другие настройки nixpkgs при необходимости
  };
}
