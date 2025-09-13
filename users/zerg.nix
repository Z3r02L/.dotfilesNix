{ config, pkgs, ... }:
let
  unstable = pkgs.unstable;
in
{
  users.users.zerg = {
    isNormalUser = true;
    home = "/home/zerg";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
    # ignoreShellProgramCheck = true;

	 packages = with pkgs; [
        zsh
        vim # Do not forget to add an editor to edit configuration.nix! The Nano e>
        wget
        curl
        git lazygit

        brave
        librewolf
  ];
  };
}
