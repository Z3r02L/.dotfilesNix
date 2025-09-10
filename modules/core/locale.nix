# modules/core/locale.nix
{ config, pkgs, ... }:
{
  # i18n = {
  #   defaultLocale = "ru_RU.UTF-8";
  #   extraLocaleSettings = {
  #     LC_ADDRESS = "ru_RU.UTF-8";
  #     LC_IDENTIFICATION = "ru_RU.UTF-8";
  #     LC_MEASUREMENT = "ru_RU.UTF-8";
  #     LC_MONETARY = "ru_RU.UTF-8";
  #     LC_NAME = "ru_RU.UTF-8";
  #     LC_NUMERIC = "ru_RU.UTF-8";
  #     LC_PAPER = "ru_RU.UTF-8";
  #     LC_TELEPHONE = "ru_RU.UTF-8";
  #     LC_TIME = "ru_RU.UTF-8";
  #   };
  # };

  # console = {
  #   font = "ter-132n";
  #   keyMap = "ruwin_alt_sh-UTF-8";
  #   useXkbConfig = true;
  # };

  # Шрифты
  fonts.packages = with pkgs; [
    maple-mono.NF
    nerd-fonts.jetbrains-mono

    # Русские
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji

    liberation_ttf

    fira-code
    fira-code-symbols
  ];
}
