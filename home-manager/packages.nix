{
  pkgs,
  pkgs-stable,
  ...
}:
{
  home.packages = with pkgs; [
    ani-cli
    audacity
    awww
    bc
    bluetui
    brightnessctl
    btop
    cava
    cpx
    dua
    dysk
    fastfetch
    ffmpeg-full
    file-roller
    gcc
    impala
    libnotify
    nautilus
    p7zip
    proton-vpn
    rar
    spotdl
    trash-cli
    uv
    viewnior
    wl-clipboard
    wl-mirror
    wl-screenrec
    yt-dlp

    (python3.withPackages (
      ps: with ps; [
        opencv-python-headless
        psutil
        requests
      ]
    ))
  ];
}
