{ pkgs, ... }: {
  services.auto-cpufreq.enable = true;
  services.gvfs.enable = true;
  services.ananicy = {
    enable = true;
    package = pkgs.ananicy-cpp;
    rulesProvider = pkgs.ananicy-rules-cachyos;
  };
}
