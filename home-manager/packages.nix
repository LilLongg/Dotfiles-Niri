{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ani-cli
    audacity
    awww
    bc
    bluetui
    brightnessctl
    cava
    cpx
    dua
    dysk
    ffmpeg-full
    file-roller
    gcc
    impala
    libnotify
    nautilus
    p7zip
    proton-vpn
    spotdl
    trash-cli
    uv
    viewnior
    wl-clipboard
    wl-mirror
    wl-screenrec
    yt-dlp
    zscroll

    (python3.withPackages (
      ps: with ps; [
        opencv-python-headless
        psutil
        requests
      ]
    ))
  ];
}
