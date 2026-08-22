{ config, ... }: {
  programs.wallust.settings.templates = {
    cava = {
      src = "cava";
      dst = "${config.xdg.configHome}/cava/config";
    };
    helix = {
      src = "helix.toml";
      dst = "${config.xdg.configHome}/helix/themes/wallust.toml";
    };
    hyprlock = {
      src = "hyprlock.conf";
      dst = "${config.xdg.configHome}/hypr/colors.conf";
    };
    gtk-dark = {
      src = "gtk.css";
      dst = "${config.xdg.dataHome}/themes/linea-nord-color/general/dark.css";
    };
    gtk-light = {
      src = "gtk.css";
      dst = "${config.xdg.dataHome}/themes/linea-nord-color/general/light.css";
    };
    gtkrc = {
      src = "gtkrc";
      dst = "${config.xdg.dataHome}/themes/linea-nord-color/gtk-2.0/gtkrc";
    };
    kitty = {
      src = "kitty.conf";
      dst = "${config.xdg.configHome}/kitty/colors.conf";
    };
    niri = {
      src = "niri.kdl";
      dst = "${config.xdg.configHome}/niri/colors.kdl";
    };
    pywalfox = {
      src = "colors.json";
      dst = "${config.xdg.cacheHome}/wal/colors.json";
    };
    rofi = {
      src = "rofi.rasi";
      dst = "${config.xdg.configHome}/rofi/colors.rasi";
    };
    swaync = {
      src = "swaync.css";
      dst = "${config.xdg.configHome}/swaync/colors.css";
    };
    vesktop = {
      src = "vesktop.css";
      dst = "${config.xdg.configHome}/vesktop/settings/quickCss.css";
    };
    waybar = {
      src = "waybar.css";
      dst = "${config.xdg.configHome}/waybar/colors.css";
    };
    wleave = {
      src = "wleave.css";
      dst = "${config.xdg.configHome}/wleave/colors.css";
    };
  };
}
