{ pkgs, ... }: {
  users.users.TNonggChann = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "dialout"
      "tty"
    ];
  };

  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    generateCompletions = true;
    vendor.completions.enable = true;
  };
}
