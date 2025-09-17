{ pkgs, config, ...}:
{
  imports = [
    ./video-driver.nix
    ./steam.nix
  ];
}
