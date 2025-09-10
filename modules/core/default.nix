{ config, pkgs, ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./network.nix
    ./packages.nix
    # ./security.nix
    ./timezone.nix

    ./nix.nix

    # ./security/default.nix

    ./services/ssh.nix
    ./services/docker.nix
    ./services/postgress.nix
  ];
}
