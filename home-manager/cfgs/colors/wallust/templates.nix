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
    kitty = {
      src = "kitty.conf";
      dst = "${config.xdg.configHome}/kitty/colors.conf";
    };
    niri = {
      src = "niri.kdl";
      dst = "${config.xdg.configHome}/niri/colors.kdl";
    };
    vesktop = {
      src = "vesktop.css";
      dst = "${config.xdg.configHome}/vesktop/settings/quickCss.css";
    };
    waybar = {
      src = "waybar.css";
      dst = "${config.xdg.configHome}/waybar/colors.css";
    };
  };
}
