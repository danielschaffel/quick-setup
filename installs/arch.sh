AUR_PACKAGES=(
    google-chrome
    grimblast-git
    bitwarden
    cliphist
)

PAC_PACKAGES=(
    hyprland hyprlauncher kitty waybar dunst polkit-kde-agent
    qt5-wayland qt6-wayland xdg-desktop-portal-hyprland
    pipewire pipewire-pulse wireplumber
    grim slurp wl-clipboard wofi dolphin
    networkmanager hyprlock sddm cmake
    tmux less jq htop ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono
    usbutils alsa-utils alsa-firmware intel-media-driver libva-intel-driver
    intel-ucode cpupower man-db qt5-wayland qt6-wayland qt5ct qt6ct 
    xdg-desktop-portal-hyprland gtk3 gtk4 
    wget openssh fzf sof-firmware bluez blueman brightnessctl
    tree mako libnotify playerctl fprintd imagemagick
    inetutils docker pavucontrol kio-extras remmina freerdp remmina-plugins
)


sudo pacman -Syu --needed git base-devel --noconfirm $PACKAGES "${PAC_PACKAGES[@]}"

sudo systemctl enable sddm
sudo systemctl enable --now NetworkManager

systemctl --user enable pipewire pipewire-pulse wireplumber
systemctl --user start pipewire pipewire-pulse wireplumber
sudo systemctl enable ssh
sudo systemctl start ssh

sudo systemctl enable ssh-agent
sudo systemctl start ssh-agent
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

sudo systemctl start docker
sudo systemctl enable docker

sudo usermod -aG docker $USER

git clone https://aur.archlinux.org/yay.git
cd yay

# Build and install
makepkg -si

# Clean up (optional)
cd ..
rm -rf yay

yay -S  "${AUR_PACKAGES[@]}"
