{
  programs.kitty = {
    enable = true;
    font = {
      name = "Iosevka Nerd Font";
      size = 13;
    };
    keybindings = {
      "ctrl+tab" = "send_text normal, application '\\x1b[9;5u'";
      "ctrl+t" = "new_tab_with_cwd";
    };
    settings = {
      include = "./colors.conf";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      mouse_hide_wait = 2.0;
      cursor_shape = "block";
      url_color = "#0087bd";
      confirm_os_window_close = 0;
      dynamic_background_opacity = 1;
      allow_remote_control = "yes";
      input_delay = 0;
      repaint_delay = 8;
      sync_to_monitor = "no";
      background_opacity = 0.9;
    };

    shellIntegration.enableFishIntegration = true;
  };
}
