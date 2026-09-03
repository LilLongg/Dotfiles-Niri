{ pkgs, ... }: {
  programs.dconf.enable = true;
  gtk.iconCache.enable = true;
  security.polkit.enable = true;
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config.common.default = "*";
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
  };
  environment.pathsToLink = [
    "/share/xdg-desktop-portal"
    "/share/applications"
  ];
}
