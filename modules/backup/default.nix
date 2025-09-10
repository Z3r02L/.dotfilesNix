# modules/backup/default.nix
{ config, pkgs, ... }:
{
  services.restic.backups = {
    "home" = {
      repository = "s3:backup-endpoint:/zerg-home";
      initialize = true;
      passwordFile = "/etc/secrets/restic-password";
      paths = [
        "/home/zerg"
        "/persist"
      ];
      exclude = [
        "/home/zerg/.cache"
        "/home/zerg/.local/share/Trash"
      ];
      timerConfig = {
        OnCalendar = "daily";
        Persistent = true;
      };
      pruneOpts = [
        "--keep-daily 7"
        "--keep-weekly 4"
        "--keep-monthly 12"
      ];
    };
  };
}
