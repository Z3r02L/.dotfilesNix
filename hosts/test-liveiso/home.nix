{
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}: {
  myHomeManager = {
    bundles.general.enable = true;
  };

  home = {
    stateVersion = "25.05";
    homeDirectory = lib.mkDefault "/home/yurii";
    username = "yurii";

    packages = with pkgs; [];
  };
}
