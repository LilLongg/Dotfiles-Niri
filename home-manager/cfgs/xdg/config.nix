{

  xdg = {
    enable = true;
    localBinInPath = true;
    mime.enable = true;

    terminal-exec = {
      enable = true;
      settings = {
        default = [ "kitty.desktop" ];
      };
    };

    userDirs = {
      enable = true;
      createDirectories = true;
      setSessionVariables = true;
    };
  };

  home.sessionVariables = {
    GTK_USE_PORTAL = 1;
  };
}
