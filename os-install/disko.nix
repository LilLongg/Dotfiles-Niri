{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  disko = {
    url = "github:nix-community/disko";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      disko,
      nixpkgs,
    }:
    {
      nixosConfigurations.TNonggChann-no-Laptop = nixpkgs.legacyPackages.x86_64-linux.nixos [
        ./configuration.nix
        disko.nixosModules.disko
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
                      type = "EF00";
                      size = "1G";
                      content = {
                        type = "filesystem";
                        format = "vfat";
                        mountpoint = "/boot";
                        mountOptions = [ "umask=0077" ];
                      };
                    };

                    SWAP = {
                      size = "8G";
                      content = {
                        type = "swap";
                        resumeDevice = true;
                      };
                    };

                    ROOT = {
                      size = "50%";
                      content = {
                        type = "filesystem";
                        format = "ext4";
                        mountpoint = "/";
                      };
                    };
                  };
                };
              };
            };
          };
        }
      ];
    };
}
