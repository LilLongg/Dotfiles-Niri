{ config, ... }: {
  systemd.user.services.vesktop-on-ram = {
    Unit = {
      description = "Save and Restore Vesktop sessionData on /dev/shm";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-vesktop-data";
      ExecStop = "${config.xdg.dataHome}/scripts/save-vesktop-data";
      RemainAfterExit = true;
    };
  };
}
