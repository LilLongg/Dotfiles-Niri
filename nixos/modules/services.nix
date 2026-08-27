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

    journald = {
      extraConfig = "Storage=volatile";
    };
  };

  systemd.services.restart-auto-cpufeq-on-resume = {
    description = "Restart auto-cpufreq when the system resume from hibernation or suspend";

    after = [
      "hibernate.target"
      "sleep.target"
    ];
    wantedBy = [
      "hibernate.target"
      "sleep.target"
    ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.systemd}/bin/systemctl restart auto-cpufreq";
      RemainAfterExit = true;
    };
  };
}
