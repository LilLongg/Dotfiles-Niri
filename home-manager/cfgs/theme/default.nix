{ pkgs, ... }: {
  imports = [
    ./gtk.nix
    ./qt.nix
  ];

  home.packages = with pkgs; [
    gtk3
    gtk4
    qt5.qtbase
    qt5.qtwayland
    qt6.qtbase
    qt6.qtwayland
  ];
}
