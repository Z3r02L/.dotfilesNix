{
disko.devices = {
  disk = {
    sda = {
      type = "disk";
      device = "/dev/sda";
      content = {
        type = "gpt";
        partitions = {
          ESP = {
            label = "boot";
            name = "ESP";
            size = "512M";
            type = "EF00";
            content = {
              type = "filesystem";
              format = "vfat";
              mountpoint = "/boot";
              mountOptions = [ "umask=0077" ];
              extraArgs = [ "-nEFI" "-F32" ];
            };
          };
          luks = {
            size = "100%";
            label = "luks";
            content = {
              type = "luks";
              name = "cryptroot";
              extraOpenArgs = [
                "--allow-discards"
                "--perf-no_read_workqueue"
                "--perf-no_write_workqueue"
              ];
              # Настройки для поддержки расшифровки с Fido2 (YubiKey)
              settings = { crypttabExtraOpts = ["fido2-device=auto" "token-timeout=5"]; };
              content = {
                type = "btrfs";
                extraArgs = ["-L" "nixos" "-f"];
                subvolumes = {
                  "@root" = {
                    mountpoint = "/";
                    mountOptions = [ "subvol=root" "compress=zstd" "noatime" ];
                  };
                  "@home" = {
                    mountpoint = "/home";
                    mountOptions = [ "subvol=home" "compress=zstd" "noatime" ];
                  };
                  "@nix" = {
                    mountpoint = "/nix";
                    mountOptions = [ "subvol=nix" "compress=zstd" "noatime" ];
                  };
                  "@snapshots" = {
                    mountpoint = "/snapshots";
                    mountOptions = [ "subvol=snapshots" "compress=zstd" "noatime" ];
                  };
                  "@games" = {
                    mountpoint = "/games";
                    mountOptions = [ "subvol=games" "compress=none" "noatime" "nodatacow" ];
                  };
                  "@persist" = {
                    mountpoint = "/persist";
                    mountOptions = [ "subvol=persist" "compress=zstd" "noatime" ];
                  };
                  "@log" = {
                    mountpoint = "/var/log";
                    mountOptions = [ "subvol=log" "compress=zstd" "noatime" ];
                  };
                  "@tmp" = {
                    mountpoint = "/var/tmp";
                    mountOptions = [ "subvol=tmp" "compress=none" "noatime" "nodatacow" ];
                  };
                  "@cache" = {
                    mountpoint = "/var/cache";
                    mountOptions = [ "subvol=cache" "compress=none" "noatime" "nodatacow" ];
                  };
                  "@db" = {
                    mountpoint = "/var/lib/db";
                    mountOptions = [ "subvol=db" "compress=none" "noatime" "nodatacow" ];
                  };
                  "@docker" = {
                    mountpoint = "/var/lib/docker";
                    mountOptions = [ "subvol=docker" "compress=none" "noatime" "nodatacow" ];
                  };
                };
              };
            };
          };
        };
      };
    };
  };
};
fileSystems."/persist".neededForBoot = true;
fileSystems."/var/log".neededForBoot = true;
}
