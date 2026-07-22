{ config, ... }: {
  services.flameshot = {
    enable = true;
    settings = {
      General = {
        contrastOpacity = 188;
        disabledTrayIcon = true;
        drawColor = "#00ff00";
        filenamePattern = "%Y%m%d_%Hh%Mm%Ss";
        savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
        showDesktopNotification = true;
        showStartupLaunchMessage = false;
        startupLaunch = true;
        useGrimAdapter = true;
      };
    };
  };
}
