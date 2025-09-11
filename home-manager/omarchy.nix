{ config, pkgs, lib, omarchy-nix, ... }:

{
  # Импортируем модуль omarchy-nix для home-manager
  imports = [ omarchy-nix.homeManagerModules.default ];

  # Конфигурация omarchy будет унаследована от системной конфигурации
  # через osConfig.omarchy
}
