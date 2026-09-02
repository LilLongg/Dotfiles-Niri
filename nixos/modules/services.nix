{ pkgs, ... }: {
  services = {
    gvfs.enable = true;
    journald = {
      extraConfig = "Storage=volatile";
    };
    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };
    tlp = {
      enable = true;
      settings = {
        RESTORE_THRESHOLDS_ON_BAT = 1;
        START_CHARGE_THRESH_BAT1 = 0;
        STOP_CHARGE_THRESH_BAT1 = 60;
      };
    };
  };
}
