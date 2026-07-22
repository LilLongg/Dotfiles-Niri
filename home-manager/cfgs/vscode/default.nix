{ config, ... }: {
  programs.vscode.enable = true;
  programs.vscode.mutableExtensionsDir = true;

  systemd.user.services.vscode-on-ram = {
    Unit = {
      description = "Save and Restore VSCode sessionData on /dev/shm";
      Wants = [ "graphical-session.target" ];
      After = [ "graphical-session.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
    Service = {
      Type = "oneshot";
      ExecStart = "${config.xdg.dataHome}/scripts/restore-vscode-data";
      ExecStop = "${config.xdg.dataHome}/scripts/save-vscode-data";
      RemainAfterExit = true;
    };
  };
}
