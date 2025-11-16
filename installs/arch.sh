AUR_PACKAGES="google-chrome"
PAC_PACKAGES=(
    hyprland kitty waybar dunst polkit-kde-agent
    qt5-wayland qt6-wayland xdg-desktop-portal-hyprland
    pipewire pipewire-pulse wireplumber
    grim slurp wl-clipboard wofi dolphin
    networkmanager hyprlock sddm cmake
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

yay -Syu --noconfirm $AUR_PACKAGES
