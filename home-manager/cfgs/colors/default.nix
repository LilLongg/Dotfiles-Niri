{ pkgs, ... }: {
  imports = [
    ./wallust
    ./wpg
  ];

  home.packages = with pkgs; [
    pywalfox-native
    wpgtk
  ];
}
