{ pkgs, ... }: {
  users.users.TNonggChann = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "kvm"
    ]; # Enable ‘sudo’ for the user.
  };

  users.defaultUserShell = pkgs.fish;
  programs.fish = {
    enable = true;
    generateCompletions = true;
    vendor.completions.enable = true;
  };
}
