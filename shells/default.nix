{ config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
    ./bash.nix
    ./fish.nix
  ];
}
