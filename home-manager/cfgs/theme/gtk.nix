{ pkgs, ... }: {
  gtk = {
    enable = true;

    theme.name = "linea-nord-color";
    gtk4.theme.name = "linea-nord-color";
    iconTheme.name = "flattrcolor";
    cursorTheme.name = "Bibata-Modern-Ice";
    cursorTheme.size = 24;

    font = {
      name = "Iosevka Nerd Font";
      size = 13;
    };
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "linea-nord-color";
        icon-theme = "flattrcolor";
        cursor-theme = "Bibata-Modern-Ice";
        cursor-size = 24;
      };
    };
  };

  home = {
    pointerCursor = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
      x11 = {
        enable = true;
        defaultCursor = true;
      };
    };
  };
}
