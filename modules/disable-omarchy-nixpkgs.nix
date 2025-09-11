{ config, pkgs, lib, ... }:

{
  # Отключаем настройку nixpkgs в omarchy-nix
  nixpkgs.config = lib.mkForce {};
}
