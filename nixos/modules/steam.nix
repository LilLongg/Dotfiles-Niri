{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      extest.enable = true;
      gamescopeSession.enable = true;
      package = pkgs.steam.override {
        extraArgs = "-system-composer";
      };
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    gamescope = {
      enable = true;
      enableWsi = true;
      capSysNice = false;
    };
  };
}
