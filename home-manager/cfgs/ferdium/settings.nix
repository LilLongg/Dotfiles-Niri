{
  xdg.configFile."Ferdium/config/settings.json".source = ./settings.json;
  xdg.configFile."Ferdium/recipes" = {
    source = ./recipes;
    recursive = true;
  };
}
