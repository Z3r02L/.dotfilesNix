{ config, pkgs, ... }:

let
  aliases = (import ./config/aliases.nix {}).aliases;
  commonInitContent = import ./config/common-init.nix {};

  zshConf = import ./zsh.nix { inherit pkgs aliases commonInitContent; };
  bashConf = import ./bash.nix { inherit pkgs aliases commonInitContent; };
  # fishConf = import ./fish.nix { inherit pkgs aliases commonInitContent; };
in
{
  programs.zsh = zshConf;
  programs.bash = bashConf;
  # programs.fish = fishConf;
}
