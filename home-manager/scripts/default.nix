{ config, pkgs, ... }: {
  home.file."${config.xdg.binHome}/bgaction".source = ./bgaction;
  home.file."${config.xdg.binHome}/select_wpp".source = ./select_wpp;

  xdg.dataFile."scripts/battery.sh".source = ./battery.sh;
  xdg.dataFile."scripts/cliphist-rofi-img".source = ./cliphist-rofi-img;
  xdg.dataFile."scripts/cputemp-monitor.py".source = ./cputemp-monitor.py;
  xdg.dataFile."scripts/image-theme.py".source = ./image-theme.py;
  xdg.dataFile."scripts/initbg".source = ./initbg;
  xdg.dataFile."scripts/mpris.py".source = ./mpris.py;
  xdg.dataFile."scripts/playerctl.py".source = ./playerctl.py;
  xdg.dataFile."scripts/record".source = ./record;
  xdg.dataFile."scripts/record_status".source = ./record_status;
  xdg.dataFile."scripts/restore-browser-profile".source = ./restore-browser-profile;
  xdg.dataFile."scripts/restore-ferdium-data".source = ./restore-ferdium-data;
  xdg.dataFile."scripts/restore-vesktop-data".source = ./restore-vesktop-data;
  xdg.dataFile."scripts/restore-vscode-data".source = ./restore-vscode-data;
  xdg.dataFile."scripts/save-browser-profile".source = ./save-browser-profile;
  xdg.dataFile."scripts/save-ferdium-data".source = ./save-ferdium-data;
  xdg.dataFile."scripts/save-vesktop-data".source = ./save-vesktop-data;
  xdg.dataFile."scripts/save-vscode-data".source = ./save-vscode-data;
  xdg.dataFile."scripts/update_player.fish".source = ./update_player.fish;
  xdg.dataFile."scripts/venvlist.nu".source = ./venvlist.nu;
  xdg.dataFile."scripts/waybar-wttr.py".source = ./waybar-wttr.py;
  xdg.dataFile."scripts/WaybarCava.sh".source = ./WaybarCava.sh;

  home.packages = [
    (pkgs.callPackage ./cpp-scripts.nix { })
  ];
}
