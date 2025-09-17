{ pkgs, lib, config, ... }: # prefs,
let

in
{
  stylix = {
    enable = true;
    base16Scheme = {
      base00 = "#202020";
      base01 = "#2a2827";
      base02 = "#504945";
      base03 = "#5a524c";
      base04 = "#bdae93";
      base05 = "#ddc7a1";
      base06 = "#ebdbb2";
      base07 = "#fbf1c7";
      base08 = "#ea6962";
      base09 = "#e78a4e";
      base0A = "#d8a657";
      base0B = "#a9b665";
      base0C = "#89b482";
      base0D = "#7daea3";
      base0E = "#d3869b";
      base0F = "#bd6f3e";
    };
    polarity = "dark"; # if prefs.stylix.darkmode then "dark" else "light"; "light" or "either"

    # cursor = {
    #   package = pkgs.${prefs.stylix.cursorPackage};
    #   name = prefs.stylix.cursorName;
    #   size = prefs.stylix.cursorSize;
    # };

    # Don’t forget to apply wallpaper
    image = pkgs.fetchurl {
      url = "https://www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
      hash = "sha256-enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    };


    fonts = {
      monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
        };
      sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
      serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };

      sizes = {
        applications = 12;
        terminal = 15;
        desktop = 10;
        popups = 10;
      };
    };

    # Aplications
    # targets = {
    #   acritty.enable = true;
    #   anki.enable = true;
    #   bat.enable = true;
    #   blender.enable = true;
    #   btop.enable = true;
    #   chromium.enable = true;
    #   nixcord.enable = true;
    # };
  };

  # wayland.windowManager.hyprland.settings.general."col.active_border" =
  # lib.mkForce "rgb(${config.stylix.base16Scheme.base0E})";
}
