{ config, pkgs, pkgs-unstable, ... }:
let
  unstable = pkgs-unstable;
in
{
  users.users.zerg = {
    isNormalUser = true;
    home = "/home/zerg";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
	  packages = with pkgs; [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano e>
        wget
        curl

        yazi

        git
        lazygit

        jujutsu
        lazyjj

        chromium
        brave

        firefox
        librewolf

        telegram-desktop
			] ++ [
			  unstable.zed-editor-fhs
			];
  };
}
