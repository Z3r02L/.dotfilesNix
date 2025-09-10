{ config, pkgs, ... }:
{
  imports = [
    ./fail2ban.nix
    ./firewall.nix
    # Добавить другие модули
  ];

  # Безопасность
  # security = {
  #   sudo = {
  #     enable = true;
  #     wheelNeedsPassword = true; # требовать пароль для SUDO
  #   };
  # };

  # root-доступ по SSH
  # services.openssh.permitRootLogin = "no";
}
