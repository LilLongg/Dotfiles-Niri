#!/usr/bin/env python

from pathlib import Path
import linecache
import subprocess
import sys

players = (
    subprocess.run(["playerctl", "-l"], capture_output=True, encoding="utf-8")
    .stdout.strip()
    .split("\n")
)
players_count = len(players)
if players_count == 0:
    exit(0)

CACHE_FILE = Path.home() / ".cache/player.cache"
active_player = linecache.getline(CACHE_FILE.as_posix(), 1).strip()

if sys.argv[1] == "change":
    try:
        idx = players.index(active_player) + 1
        if idx == players_count:
            idx = 0
    except ValueError:
        idx = 0

    with open(CACHE_FILE, "w") as cf:
        cf.write(players[idx])

    exit(0)

if active_player not in players:
    active_player = players[0]

PLAYERCTL_ARGS = ["playerctl", "-p", active_player]

match sys.argv[1]:
    case "stop":
        subprocess.run(PLAYERCTL_ARGS + ["stop"], capture_output=True)
    case "toggle":
        subprocess.run(PLAYERCTL_ARGS + ["play-pause"], capture_output=True)
    case "shuffle":
        subprocess.run(PLAYERCTL_ARGS + ["shuffle", "toggle"], capture_output=True)
    case "loop":
        loop_status = subprocess.run(
            PLAYERCTL_ARGS + ["loop"], capture_output=True, encoding="utf-8"
        ).stdout.strip()

        NEXT_LOOP_STATUS = "Playlist" if loop_status == "Track" else "Track"
        subprocess.run(PLAYERCTL_ARGS + ["loop", NEXT_LOOP_STATUS])
    case "next":
        subprocess.run(PLAYERCTL_ARGS + ["next"], capture_output=True)
    case "previous":
        subprocess.run(PLAYERCTL_ARGS + ["previous"], capture_output=True)
    case "seek":
        subprocess.run(PLAYERCTL_ARGS + ["position", sys.argv[2]], capture_output=True)
