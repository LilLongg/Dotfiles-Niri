#!/usr/bin/env python

import psutil
import time
from pathlib import Path

CPU_TEMP_SENSOR_PRIORITY = "coretemp"
TEMP_FILE = Path("/dev/shm/temperature.cache")

while True:
    with open(TEMP_FILE, "w") as buffer:
        DATA = psutil.sensors_temperatures()
        temps = [temp.current for temp in DATA[CPU_TEMP_SENSOR_PRIORITY]]
        temp = int(sum(temps) / len(temps) * 1000)
        buffer.write(str(temp))

    time.sleep(1)
