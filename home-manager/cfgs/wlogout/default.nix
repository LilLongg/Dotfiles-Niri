{ config, ... }: {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
      }
      {
        label = "hibernate";
        action = "systemctl hibernate";
        text = "Hibernate";
      }
      {
        label = "logout";
        action = "niri msg action quit -s";
        text = "Logout";
      }
      {
        label = "Shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
      }
    ];

    style = ''
      @import "colors.css";

      * {
        background-image: none;
        box-shadow: none;
        font-family: "Pixelon";
      }

      window {
        background-color: rgba(12, 12, 12, 0.9);
      }

      button {
        border-radius: 0;
        border-color: black;
        text-decoration-color: #ffffff;
        color: @on_background;
        background-color: @primary_container;
        border-style: solid;
        border-width: 1px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
      }

      button:focus,
      button:active,
      button:hover {
        background-color: @on_primary;
        outline-style: none;
      }

      #lock {
        background-image: image(
          url("${config.xdg.dataHome}/assets/lock.png"),
        );
      }

      #logout {
        background-image: image(
          url("${config.xdg.dataHome}/assets/logout.png"),
        );
      }

      #suspend {
        background-image: image(
          url("${config.xdg.dataHome}/assets/suspend.png"),
        );
      }

      #hibernate {
        background-image: image(
          url("${config.xdg.dataHome}/assets/hibernate.png"),
        );
      }

      #shutdown {
        background-image: image(
          url("${config.xdg.dataHome}/assets/shutdown.png"),
        );
      }

      #reboot {
        background-image: image(
          url("${config.xdg.dataHome}/assets/reboot.png"),
        );
      }
    '';
  };
}
