#!/bin/bash
# builds whisper.cpp into ~/.local and grabs the dictation models.
# no sudo needed - everything lands under $HOME.

set -e

REPO=$(cd "$(dirname "$0")/.." && pwd)
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

# link the unit ourselves. run.sh does installs/ before dotfiles/link.sh, so
# on a fresh machine the symlink isn't there yet and enable would fail.
# link.sh redoing this later is harmless.
UNIT_DST="$HOME/.config/systemd/user/whisper-server.service"
mkdir -p "$(dirname "$UNIT_DST")"
ln -sfn "$REPO/dotfiles/systemd/user/whisper-server.service" "$UNIT_DST"

# a headless or ssh run has no user bus - don't let that abort the install
if systemctl --user daemon-reload 2>/dev/null; then
    systemctl --user enable --now whisper-server.service || true
else
    echo "no user systemd session; once logged in, run:"
    echo "  systemctl --user enable --now whisper-server.service"
fi

# these come from the package lists, so shout rather than fail if absent
for tool in pw-record wtype wl-copy notify-send; do
    command -v "$tool" >/dev/null 2>&1 || echo "WARNING: $tool not found - dictate needs it"
done

echo "whisper ready. mod+y to talk."
