{ pkgs, ... }:
let
  tomlFormat = pkgs.formats.toml { };

  cfgData = {
    subject_format = "Playerctl";
    body_format = "Playing: <b>{title}</b>\nBy <b>{artist}</b>\nFrom <i>{album}</i>";
    join_string = ", ";
    enable_album_art = true;
    album_art_deadline = 1000;
    urgency = 0;
  };

  mprisNotifierConf = tomlFormat.generate "mpris-notifier-config.toml" cfgData;
in
{
  xdg.configFile."mpris-notifier/config.toml".source = mprisNotifierConf;
}
