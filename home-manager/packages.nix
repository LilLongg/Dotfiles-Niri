{
  pkgs,
  pkgs-stable,
  ...
}:
{
  home.packages = with pkgs; [
    activate-linux
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
    proton-vpn
    rar
    spotdl
    trash-cli
    unzip
    uv
    viewnior
    wl-clipboard
    wl-mirror
    wl-screenrec
    yt-dlp
    zip

    (python3.withPackages (
      ps: with ps; [
        opencv-python-headless
        psutil
        requests
      ]
    ))
  ];
}
