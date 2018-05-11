#!/bin/bash

cat >"$HOME/.bash_profile" <<'EOL'
export ANDROID_HOME="/home/Program/0Android/Sdk"
export PATH=${PATH};$ANDROID_HOME/tools;$ANDROID_HOME/emulator;$ANDROID_HOME/platform-tools;$ANDROID_HOME/build-tools
EOL
source $HOME/.bash_profile