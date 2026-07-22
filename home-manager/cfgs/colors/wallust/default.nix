{
  imports = [
    ./config.nix
    ./templates.nix
  ];
  xdg.configFile."wallust/templates" = {
    source = ./templates;
    recursive = true;
  };
}
