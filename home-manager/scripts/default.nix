{ config, pkgs, ... }: {
  home.file."${config.xdg.binHome}/bgaction".source = ./bgaction;
  home.file."${config.xdg.binHome}/select_wpp".source = ./select_wpp;
  home.file."${config.xdg.binHome}/scripts/wpg-install.sh".source = ./wpg-install.sh;

  xdg.dataFile."scripts/battery.sh".source = ./battery.sh;
  xdg.dataFile."scripts/cliphist-rofi-img".source = ./cliphist-rofi-img;
  xdg.dataFile."scripts/cputemp-monitor.py".source = ./cputemp-monitor.py;
  xdg.dataFile."scripts/image-theme.py".source = ./image-theme.py;
  xdg.dataFile."scripts/initbg".source = ./initbg;
  xdg.dataFile."scripts/mpris.py".source = ./mpris.py;
  xdg.dataFile."scripts/record".source = ./record;
  xdg.dataFile."scripts/record_status".source = ./record_status;
  xdg.dataFile."scripts/remove-bad-files.py".source = ./remove-bad-files.py;
  xdg.dataFile."scripts/toggle-loop".source = ./toggle-loop;
  xdg.dataFile."scripts/update-icon.py".source = ./update-icon.py;
  xdg.dataFile."scripts/WaybarCava.sh".source = ./WaybarCava.sh;
  xdg.dataFile."scripts/waybar-wttr.py".source = ./waybar-wttr.py;

  home.packages = [
    (pkgs.callPackage ./cpp-scripts.nix { })
  ];
}
