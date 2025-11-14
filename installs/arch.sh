PAC_PACKAGES="hyprland kitty waybar dunst polkit-kde-agent qt5-wayland qt6-wayland xdg-desktop-portal-hyprland pipewire pipewire-pulse wireplumber grim slurp wl-clipboard wofi dolphin networkmanager nm-applet hyprlock sddm"
AUR_PACKAGES=""

sudo pacman -Syu --needed git base-devel --noconfirm $PACKAGES $PAC_PACKAGES

sudo systemctl enable sddm
sudo systemctl enable --now NetworkManager


yay -Syu --noconfirm $AUR_PACKAGES
