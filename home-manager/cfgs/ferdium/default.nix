{ pkgs, ... }: {
  imports = [
    ./ferdium-on-ram.nix
    ./settings.nix
  ];

  home.packages = with pkgs; [
    ferdium
  ];
}
