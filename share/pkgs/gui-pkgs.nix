{ config, pkgs, ... }:

{
  packages = with pkgs; [
    alacritty

    brave
    librewolf

    telegram-desktop

  ] ++ [
		unstable.zed-editor-fhs
	];
}
