{ config, ... }: {
  systemd.user.services.cputemp-monitor = {
    Unit = {
      Description = "Monitor cpu temperatures.";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${config.xdg.dataHome}/scripts/cputemp-monitor.py";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
