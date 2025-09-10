# modules/core/nix.nix (новый модуль)
{ config, pkgs, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0Ae279kq8Y3jzocMJ8LRzJ6jPFoRkA="
        "nix-community.cachix.org-1:mB9FSh9qfCD4Dq6XG52nKkLM8M2NkzQe3Hj6t0IHOgk="
      ];
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };
}
