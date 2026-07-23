{
  home.shell.enableFishIntegration = true;
  imports = [ ./yazi-plugins ];

  programs.lsd = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      sorting = {
        dir-grouping = "first";
      };
    };
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      mgr = {
        sort_by = "natural";
        sort_translit = true;
        linemode = "mtime";
      };
      preview = {
        wrap = "yes";
      };
    };
  };
}
