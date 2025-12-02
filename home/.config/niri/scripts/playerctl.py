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


class Playerctl:
    def __init__(self, name):
        self.__name = name
        self.__args = ["playerctl", "-p", name]

    def stop(self):
        subprocess.run(self.__args + ["stop"], capture_output=True)

    def toggle(self):
        subprocess.run(self.__args + ["play-pause"], capture_output=True)

    def shuffle(self):
        subprocess.run(self.__args + ["shuffle", "toggle"])

    def loop(self):
        LOOP_STATUS = subprocess.run(
            self.__args + ["loop"], capture_output=True, encoding="utf-8"
        ).stdout.strip()

        NEXT_LOOP_STATUS = "Playlist" if LOOP_STATUS == "Track" else "Track"
        subprocess.run(self.__args + ["loop", NEXT_LOOP_STATUS])

    def next(self):
        subprocess.run(self.__args + ["next"], capture_output=True)

    def previous(self):
        subprocess.run(self.__args + ["previous"], capture_output=True)

    def seek_forward(self, offset):
        subprocess.run(self.__args + ["position", f"{offset}+"], capture_output=True)

    def seek_backward(self, offset):
        subprocess.run(self.__args + ["position", f"{offset}-"], capture_output=True)


class Mpdctl(Playerctl):
    def __init__(self):
        super().__init__("mpd")

    def seek_forward(self, offset):
        subprocess.run(["mpc", "seek", f"+{offset}"])

    def seek_backward(self, offset):
        subprocess.run(["mpc", "seek", f"-{offset}"])


player_controller = (
    Mpdctl() if active_player.startswith("mpd") else Playerctl(active_player)
)

match sys.argv[1]:
    case "stop":
        player_controller.stop()
    case "toggle":
        player_controller.toggle()
    case "shuffle":
        player_controller.shuffle()
    case "loop":
        player_controller.loop()
    case "next":
        player_controller.next()
    case "previous":
        player_controller.previous()
    case "seek-fw":
        player_controller.seek_forward(sys.argv[2])
    case "seek-bw":
        player_controller.seek_backward(sys.argv[2])
