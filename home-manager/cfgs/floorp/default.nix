{
  programs.floorp.enable = true;
  imports = [
    ./floorp-on-ram.nix
    ./profile.nix

    ./extensions
  ];
}
