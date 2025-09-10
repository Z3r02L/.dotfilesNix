# modules/core/services.nix (объединить все сервисы)
{ config, pkgs, ... }:
{
  imports = [
    ./ssh.nix
    ./docker.nix
    ./postgresql.nix
    # Добавить другие сервисы
  ];

  # Общие настройки сервисов
  services = {
    # Logrotate для системных логов
    logrotate.settings = {
      "/var/log/*.log" = {
        frequency = "daily";
        rotate = 7;
        compress = true;
        missingok = true;
        notifempty = true;
      };
    };

    # Cron для автоматических задач
    cron = {
      enable = true;
      systemCronJobs = [
        "0 3 * * * ${pkgs.coreutils}/bin/nix-collect-garbage -d"
      ];
    };
  };
}
