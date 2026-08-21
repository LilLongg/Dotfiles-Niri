{
  services.swaync.settings = {
    positionX = "right";
    positionY = "top";
    layer = "overlay";
    control-center-layer = "top";
    layer-shell = true;
    cssPriority = "application";
    control-center-margin-top = 5;
    control-center-margin-bottom = 0;
    control-center-margin-right = 7;
    control-center-margin-left = 0;
    notification-2fa-action = true;
    notification-inline-replies = true;
    notification-icon-size = 24;
    notification-body-image-height = 100;
    notification-body-image-width = 200;
    timeout = 5;
    timeout-low = 3;
    timeout-critical = 10;
    fit-to-screen = false;
    control-center-width = 500;
    control-center-height = 1130;
    notification-window-width = 400;
    keyboard-shortcuts = true;
    image-visibility = "when-available";
    transition-time = 200;
    hide-on-clear = false;
    hide-on-action = true;
    script-fail-notify = true;
    widgets = [
      "mpris"
      "title"
      "dnd"
      "notification"
    ];
    widget-config = {
      label = {
        max-lines = 3;
        text = "Notification";
      };
      mpris = {
        image-size = 60;
        image-radius = 10;
      };
      title = {
        text = "Notifications";
        clear-all-button = true;
        button-text = "Clear";
      };
      dnd = {
        text = "Do Not Disturb";
      };
    };
    notification-visibility = {
      ignore-flameshot-warning = {
        state = "ignored";
        body = "grim's screenshot component is implemented based on wlroots, it may not be used in GNOME or similar desktop environments";
      };
      ignore-home-manager = {
        state = "ignored";
        summary = "Home Manager";
      };
      ignore-fcitx-switch = {
        state = "ignored";
        summary = "Switch group";
      };
      ignore-fcitx-warning = {
        state = "ignored";
        summary = "Wayland Diagnose";
      };
    };
  };
}
