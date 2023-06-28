#!/bin/sh

# Kill all process used for running conan server
killall 9 ConanSandboxServer.exe
killall 9 ConanSandboxServer-Win64-Test.exe
killall 9 Xvfb

# Update the server
/usr/bin/screen -d -m steamcmd +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /home/steam/conan_exiles +app_update 443030 +exit
sleep 2s

# Run the script that updates the workshop -> mods
sh /home/steam/scripts/add_mods.sh
