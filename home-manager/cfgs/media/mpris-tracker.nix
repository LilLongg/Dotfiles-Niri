{ config, ... }: {
  systemd.user.services.mpris-tracker = {
    Unit = {
      Description = "Track the most recently used MPRIS client.";
      Wants = [ "mpd-mpris" ];
      After = [ "mpd-mpris" ];
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${config.xdg.dataHome}/scripts/update_player.fish";
      Restart = "always";
      RestartSec = 5;
    };
  };
}
