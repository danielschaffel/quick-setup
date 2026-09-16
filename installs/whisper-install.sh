#!/bin/bash
# builds whisper.cpp into ~/.local and grabs the dictation models.
# no sudo needed - everything lands under $HOME.

set -e

CWD=$(dirname "$0")
SRC="$HOME/Documents/code/whisper.cpp"
MODEL_DIR="$HOME/.local/share/whisper-models"

mkdir -p "$HOME/Documents/code"
cd "$HOME/Documents/code"

if [ -d "$SRC" ]; then
    echo "whisper.cpp directory already exists. Pulling."
    cd "$SRC"
    git pull --ff-only || true
else
    echo "Cloning whisper.cpp repository..."
    git clone --depth 1 https://github.com/ggml-org/whisper.cpp.git
    cd "$SRC"
fi

# RPATH matters: hyprland binds and systemd units don't source .bashrc,
# so the loader has to find ~/.local/lib without LD_LIBRARY_PATH
cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$HOME/.local" \
    -DWHISPER_BUILD_TESTS=OFF \
    -DWHISPER_BUILD_EXAMPLES=ON \
    -DWHISPER_BUILD_SERVER=ON \
    -DCMAKE_INSTALL_RPATH="$HOME/.local/lib" \
    -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON

cmake --build build -j"$(nproc)" --config Release
cmake --install build

mkdir -p "$MODEL_DIR"
cd "$MODEL_DIR"

# base.en is the daily driver (~0.7s a shot on lunar lake).
# small.en is the accuracy fallback, ~3x slower - swap via WHISPER_MODEL.
for model in base.en small.en; do
    if [ -f "ggml-$model-q5_1.bin" ]; then
        echo "ggml-$model-q5_1.bin already present. Skipping."
    else
        echo "Downloading $model..."
        curl -L -o "ggml-$model-q5_1.bin" \
            "https://huggingface.co/ggerganov/whisper.cpp/resolve/main/ggml-$model-q5_1.bin"
    fi
done

systemctl --user daemon-reload
systemctl --user enable --now whisper-server.service

cd "$CWD"
echo "whisper ready. bind dictate to a key and talk."
