{ config, lib, pkgs, pkgs-unstable, ... }:
let
  unstable = pkgs-unstable;
in
{
  # Programs
  programs.firefox.enable = true;
  programs.amnezia-vpn.enable = true;

  environment.systemPackages = with pkgs; [
    amnezia-vpn
    vim
    wget
    curl
    git
  ] ++ [
    unstable.zed-editor-fhs
  ];
}
