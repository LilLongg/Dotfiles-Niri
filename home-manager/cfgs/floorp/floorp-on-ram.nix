{ config, ... }: {
  systemd.user.services.floorp-on-ram = {
    Unit = {
      Description = "Save and Restore Floorp profile on /dev/shm";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-browser-profile";
      ExecStop = "${config.xdg.dataHome}/scripts/save-browser-profile";
      RemainAfterExit = true;
    };
  };
}
