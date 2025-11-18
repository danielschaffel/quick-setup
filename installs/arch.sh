AUR_PACKAGES=(
    google-chrome
)
PAC_PACKAGES=(
    hyprland kitty waybar dunst polkit-kde-agent
    qt5-wayland qt6-wayland xdg-desktop-portal-hyprland
    pipewire pipewire-pulse wireplumber
    grim slurp wl-clipboard wofi dolphin
    networkmanager hyprlock sddm cmake
    tmux less jq htop ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono
    usbutils alsa-utils alsa-firmware intel-media-driver libva-intel-driver
    intel-ucode cpupower man-db qt5-wayland qt6-wayland qt5ct qt6ct 
    xdg-desktop-portal-hyprland gtk3 gtk4 
)


sudo pacman -Syu --needed git base-devel --noconfirm $PACKAGES "${PAC_PACKAGES[@]}"

sudo systemctl enable sddm
sudo systemctl enable --now NetworkManager

git clone https://aur.archlinux.org/yay.git
cd yay

# Build and install
makepkg -si

# Clean up (optional)
cd ..
rm -rf yay

yay -S  "${AUR_PACKAGES[@]}"
