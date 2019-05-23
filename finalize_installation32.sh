#!/bin/bash

WINEPREFIX=/home/wine/.wine32 WINEARCH=win32 \
winecfg && \
WINEPREFIX=/home/wine/.wine32 WINEARCH=win32 \
winetricks --no-isolate steam && \
echo "You can now launch steam just by typing 'steam'."
