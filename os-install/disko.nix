{
  disko.devices = {
    disk = {
      my-disk = {
        device = "/dev/nvme0n1";
        type = "disk";
        content = {
          type = "gpt";
          partitions = {
            ESP = {
              label = "ESP";
              type = "EF00";
              size = "1G";
              priority = 1;
              content = {
                type = "filesystem";
                format = "vfat";
                mountpoint = "/boot";
                mountOptions = [ "umask=0077" ];
              };
            };

            SWAP = {
              label = "SWAP";
              size = "8G";
              content = {
                type = "swap";
                resumeDevice = true;
              };
            };

            ROOT = {
              label = "ROOT";
              end = "-128G";
              content = {
                type = "btrfs";
                extraArgs = [ "-f" ];
                mountpoint = "/partition-root";
                subvolumes = {
                  "/rootfs" = {
                    mountpoint = "/";
                  };
                  "/nix" = {
                    mountpoint = "/nix";
                    mountOptions = [
                      "compress=zstd"
                      "noatime"
                    ];
                  };
                  "/home" = {
                    mountpoint = "/home";
                    mountOptions = [ "compress=zstd" ];
                  };
                  "/home/TNonggChann" = { };
                };
              };
            };
          };
        };
      };
    };
  };
}
