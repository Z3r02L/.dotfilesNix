{ config, pkgs, ... }:

{
  imports = [
    ./audio.nix
    ./game.nix
    ./x11.nix
    ./programs.nix
  ];
}
