{ pkgs, ... }: {
  programs.steam = {
    enable = true;
    extest.enable = true;
    package = pkgs.steam.override {
      extraArgs = "-system-composer";
    };
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}
