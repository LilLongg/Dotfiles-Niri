{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  programs.nix-ld.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];
}
