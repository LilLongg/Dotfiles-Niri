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
    home-manager
  ];
}
