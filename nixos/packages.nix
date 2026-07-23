{
  pkgs,
  pkgs-stable,
  inputs,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    bibata-cursors
    git
    helix
    home-manager
  ];
}
