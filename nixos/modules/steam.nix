{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    extest.enable = true;
    package = pkgs.steam.override {
      extraArgs = "-system-composer";
    };
  };
}
