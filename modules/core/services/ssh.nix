{ config, pkgs, ... }:
{
# Включаем и настраиваем сервис sshd
  services.openssh = {
    enable = true;
    settings = {
      # PermitRootLogin = "no";
      # PasswordAuthentication = false;
      # KbdInteractiveAuthentication = false;
    };
    ports = [ 22 ];
  };

}
