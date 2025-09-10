{ config, pkgs, ... }: {
  home.packages = [
    pkgs.git
    pkgs.vim
  ];
  programs.zsh.enable = true;
}
