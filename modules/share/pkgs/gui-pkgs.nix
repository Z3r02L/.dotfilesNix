{ config, pkgs, ... }:

{
  packages = with pkgs; [
    alacritty

    brave
    librewolf

    telegram-desktop
		zed-editor-fhs
	];
}
