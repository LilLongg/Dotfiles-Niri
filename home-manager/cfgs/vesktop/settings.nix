{
  xdg.configFile."vesktop/settings/settings.json".source = ./settings.json;
  programs.vesktop = {
    enable = true;
    settings = {
      tray = true;
      minimizeToTray = true;
      clickTrayToShowHide = true;
      autoStartMinimized = false;
      disableSmoothScroll = false;
      hardwareAcceleration = true;
      hardwareVideoAcceleration = true;
    };
  };
}
