{ pkgs, ... }: {
  imports = [
    ./mpd.nix
    ./mpv.nix
    ./mpris-tracker.nix

    ./mpris-notifier
    ./rmpc
  ];

  home.packages = with pkgs; [
    mpc
    playerctl
    rmpc
  ];
}
