# aliases.nix
{ }:

{
  aliases = {
    ll = "ls -la";
    
    update = "sudo nixos-rebuild build --flake ~/.dotfilesNix/#zerg && \
              sudo nixos-rebuild switch --flake ~/.dotfilesNix/#zerg && \
              home-manager switch --flake ~/.dotfilesNix/#zerg
    ";
    nrs = "nixos-rebuild switch --flake ~/.dotfilesNix/#zerg";
    hms = "home-manager switch --flake ~/.dotfilesNix/#zerg";

    g = "git";
    gst = "git status";
    gco = "git checkout";
    gbr = "git branch";
    ga = "git add";
    gc = "git commit -m";
    gp = "git push";
    gl = "git pull";
  };
}
