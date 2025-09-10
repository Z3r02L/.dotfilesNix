{ config, pkgs, ... }:

{
  packages = with pkgs; [
    wget
    curl
    vim # Do not forget to add an editor to edit configuration.nix! The Nano e>

    zoxide
    fzf
    yazi
    tmux

    git
    lazygit
  ];
}
