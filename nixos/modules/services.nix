{ pkgs, ... }: {
  services = {
    gvfs.enable = true;

    ananicy = {
      enable = true;
      package = pkgs.ananicy-cpp;
      rulesProvider = pkgs.ananicy-rules-cachyos;
    };

    auto-cpufreq = {
      enable = true;
      settings = {
        battery = {
          enable_thresholds = true;
          start_threshold = 0;
          stop_threshold = 60;
        };
      };
    };
  };
}
