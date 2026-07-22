{ pkgs, ... }: {
  home.packages = with pkgs; [
    unifont
    sarasa-gothic
    noto-fonts-color-emoji
    nerd-fonts.iosevka
    nerd-fonts.symbols-only
  ];
  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      emoji = [
        "Symbols Nerd Font"
        "Noto Color Emoji"
      ];
      monospace = [
        "Sarasa Mono CL"
        "Sarasa Mono J"
        "Sarasa Mono K"
        "Sarasa Mono HC"
        "Sarasa Mono SC"
        "Sarasa Mono TC"
      ];
      serif = [
        "Sarasa Fixed Slab CL"
        "Sarasa Fixed Slab J"
        "Sarasa Fixed Slab K"
        "Sarasa Fixed Slab HC"
        "Sarasa Fixed Slab SC"
        "Sarasa Fixed Slab TC"
      ];
      sansSerif = [
        "Sarasa Fixed CL"
        "Sarasa Fixed J"
        "Sarasa Fixed K"
        "Sarasa Fixed HC"
        "Sarasa Fixed SC"
        "Sarasa Fixed TC"
      ];
    };
  };
}
