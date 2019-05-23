#!/bin/bash

WINEPREFIX=/home/wine/.wine64 WINEARCH=win64 \
winecfg && \
WINEPREFIX=/home/wine/.wine64 WINEARCH=win64 \
winetricks --no-isolate steam && \
echo "You can now launch steam just by typing 'steam'."
