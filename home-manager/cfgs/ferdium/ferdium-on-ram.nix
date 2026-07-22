{ config, ... }: {
  systemd.user.services.ferdium-on-ram = {
    Unit = {
      description = "Save and Restore Ferdium sessionData on /dev/shm";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-ferdium-data";
      ExecStop = "${config.xdg.dataHome}/scripts/save-ferdium-data";
      RemainAfterExit = true;
    };
  };
}
