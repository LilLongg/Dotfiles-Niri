{ pkgs, ... }: {
  users.users.TNonggChann = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    generateCompletions = true;
    vendor.completions.enable = true;
  };
}
