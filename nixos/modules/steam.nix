{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      extest.enable = true;
      gamescopeSession = {
        enable = true;
        args = [
          "--mangoapp"
          "--adaptive-sync"
          "--fullscreen"
        ];
      };
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
      args = [
        "--mangoapp"
        "--adaptive-sync"
        "--fullscreen"
      ];
      env = {
        PROTON_ENABLE_WAYLAND = "1";
        PROTON_DXVK_LOWLATENCY = "1";
        PROTON_NO_WM_DECORATION = "1";
        PROTON_USE_NTSYNC = "1";
        PROTON_USE_WINE3D = "1";
        WINE_NO_WM_DECORATION = "1";
      };
    };
  };
}
