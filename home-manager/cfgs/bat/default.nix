{ pkgs, ... }: {
  programs.bat = {
    enable = true;
    extraPackages = with pkgs.bat-extras; [
      batdiff
      batman
    ];
  };
  home.sessionVariables = {
    MANPAGER = "batman";
  };
}
