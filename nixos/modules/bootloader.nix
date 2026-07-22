{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_zen;
    kernelParams = [ "resume=LABEL=SWAP" ];
    loader = {
      timeout = 10;

      efi = {
        efiSysMountPoint = "/boot";
        canTouchEfiVariables = true;
      };

      grub = {
        efiSupport = true;
        device = "nodev";
        useOSProber = true;
        theme = "${
          (pkgs.fetchFromGitHub {
            owner = "harishnkr";
            repo = "bsol";
            rev = "8f39f66967e2391b11ee554578f0b821070ec72a";
            hash = "sha256-UD5crwJdqnKVnxTN2vHIukJnQuzxmkko3E5wb8Xg6gs=";
          })
        }/bsol";
      };
    };
  };
}
