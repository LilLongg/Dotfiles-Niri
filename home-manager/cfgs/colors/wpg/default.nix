{ config, ... }: {
  home.file."${config.xdg.binHome}/wpg-install.sh".source = ./wpg-install.sh;
  xdg.configFile."wpg/wpg.conf".source = ./wpg.conf;
}
