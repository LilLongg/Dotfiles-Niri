{ config, ... }: {
  programs.waybar.settings = {
    mainBar = {
      position = "top";
      mode = "dock";
      height = 50;
      reload-on-style-change = true;

      modules-left = [
        "clock"
        "custom/weather"
        "group/hardware"
        "network"
        "bluetooth"
      ];

      modules-center = [
        "custom/launch_app"
        "niri/workspaces"
        "custom/record"
        "custom/power_btn"
      ];

      modules-right = [
        "custom/mpris"
        "custom/cava_mviz"
        "pulseaudio"
        "pulseaudio#microphone"
        "backlight"
        "tray"
      ];

      clock = {
        format = " {:L%H:%M   %a, %b %d}";
        tooltip = true;
        tooltip-format = "<tt><small>{calendar}</small></tt>";
        calendar = {
          mode = "year";
          mode-mon-col = 3;
          weeks-pos = "right";
          on-scroll = 1;
          format = {
            months = "<span color='#5ec07b'><b>{}</b></span>";
            days = "<span color='#c678dd'><b>{}</b></span>";
            weeks = "<span color='#61afef'><b>W{}</b></span>";
            weekdays = "<span color='#ffa812'><b>{}</b></span>";
            today = "<span color='#e06c75'><b><u>{}</u></b></span>";
          };
        };
      };

      "custom/weather" = {
        format = "{}";
        tooltip = true;
        interval = 900;
        exec = "${config.xdg.dataHome}/scripts/waybar-wttr.py";
        return-type = "json";
      };

      "group/hardware" = {
        orientation = "horizontal";
        drawer = {
          click-to-reveal = true;
          start-expanded = true;
        };
        modules = [
          "battery"
          "temperature"
          "cpu"
          "memory"
        ];
      };

      battery = {
        bat-compatability = true;
        interval = 1;
        format = "{icon} {capacity}%";
        format-charging = " {capacity}%";
        format-plugged = " {capacity}%";
        format-icons = [
          "󰂎"
          "󰁺"
          "󰁻"
          "󰁼"
          "󰁽"
          "󰁾"
          "󰁿"
          "󰂀"
          "󰂁"
          "󰂂"
          "󰁹"
        ];
        states = {
          good = 95;
          warning = 30;
          critical = 20;
        };
      };

      temperature = {
        interval = 1;
        "hwmon-path" = [
          "/dev/shm/temperature.cache"
        ];
        format = " {temperatureC}°C";
        format-warning = " {temperatureC}°C";
        format-critical = " {temperatureC}°C";
        tooltip = true;
        tooltip-format = "Cpu temperature";
        warning-threshold = 60;
        critical-threshold = 75;
        on-click = "kitty --class btop sh -c 'btop'";
      };

      cpu = {
        interval = 1;
        format = " {usage}%";
        on-click = "kitty --class btop sh -c 'btop'";
      };

      memory = {
        interval = 1;
        format = " {percentage}%";
        tooltip = true;
        tooltip-format = "Memory - {used:0.2f}GB / {total:0.2f}GB ({percentage}%)\nSwap - {swapUsed:0.2f}GB / {swapTotal:0.2f}GB ({swapPercentage}%)";
        on-click = "kitty --class btop sh -c 'btop'";
      };

      network = {
        interval = 1;
        interface = "wlan0";
        format = " {bandwidthDownBits}  {bandwidthUpBits}";
        format-wifi = " {essid}";
        format-ethernet = "󰊗 {ipaddr}/{cidr}";
        format-disconnect = "󰖪 off";
        tooltip-format = "{ifname} via {gwaddr} 󰊗";
        tooltip-format-wifi = "Wifi: {essid}\n {bandwidthDownBits}  {bandwidthUpBits}";
        tooltip-format-disconnected = "Disconnected";
        on-click = "kitty --class impala sh -c 'impala'";
      };

      bluetooth = {
        "format-on" = " on";
        "format-off" = "󰂲 off";
        "format-disabled" = "󰂲 off";
        "format-connected" = " {device_alias}";
        "format-connected-battery" = " {device_alias} {device_battery_percentage}%";
        "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
        "tooltip-format-connected" =
          "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
        "tooltip-format-enumerate-connected" = "{device_alias}\t{device_address}";
        "tooltip-format-enumerate-connected-battery" =
          "{device_alias}\t{device_address}\t{device_battery_percentage}%";
        "on-click" = "kitty --class bluetui bluetui";
      };

      "custom/launch_app" = {
        "format" = " ";
        "on-click" = "rofi -show drun";
        "tooltip" = true;
        "tooltip-format" = "Open an app";
      };

      "niri/workspaces" = {
        "format" = "{icon}";
        "format-icons" = {
          "1" = "一";
          "2" = "二";
          "3" = "三";
          "4" = "四";
          "5" = "五";
          "6" = "六";
          "7" = "七";
          "8" = "八";
          "9" = "九";
          "10" = "十";
        };
      };

      "custom/record" = {
        "interval" = 1;
        "format" = { };
        "tooltip" = true;
        "exec" = "${config.xdg.dataHome}/scripts/record_status";
        "return-type" = "json";
        "on-click" = "${config.xdg.dataHome}/scripts/record";
        "on-click-right" = "${config.xdg.dataHome}/scripts/record select";
      };

      "custom/power_btn" = {
        "format" = "";
        "on-click" = "sh -c '(wlogout --protocol layer-shell)' & disown";
        "tooltip" = true;
        "tooltip-format" = "Power options";
      };

      "custom/mpris" = {
        "interval" = 1;
        "format" = "{}";
        "tooltip" = true;
        "exec" = "${config.xdg.dataHome}/scripts/mpris.py";
        "return-type" = "json";
        "on-click" = "${config.xdg.dataHome}/scripts/playerctl.py toggle";
        "on-click-right" = "${config.xdg.dataHome}/scripts/playerctl.py change";
      };

      "custom/cava_mviz" = {
        "format" = "{}";
        "exec" = "${config.xdg.dataHome}/scripts/WaybarCava.sh";
        "tooltip" = false;
      };

      "pulseaudio" = {
        "format" = "{icon}{volume}%";
        "format-muted" = "";
        "tooltip" = false;
        "on-click" = "volumectl toggle-mute";
        "on-scroll-up" = "volumectl up";
        "on-scroll-down" = "volumectl down";
        "scroll-step" = 5;
        "format-icons" = {
          "headphone" = " ";
          "hands-free" = " ";
          "headset" = " ";
          "phone" = " ";
          "portable" = " ";
          "car" = " ";
          "default" = [
            " "
            " "
            " "
          ];
        };
      };

      "pulseaudio#microphone" = {
        "format" = "{format_source}";
        "format-source" = " {volume}%";
        "format-source-muted" = "";
        "on-click" = "volumectl -m toggle-mute";
        "on-scroll-up" = "volumectl -m up";
        "on-scroll-down" = "volumectl -m down";
        "scroll-step" = 5;
      };

      "backlight" = {
        "format" = "{icon}{percent}%";
        "format-icons" = [
          "󰃞 "
          "󰃟 "
          "󰃠 "
        ];
        "on-scroll-up" = "lightctl up";
        "on-scroll-down" = "lightctl down";
      };

      tray = {
        icon-size = 18;
        spacing = 10;
      };
    };
  };
}
