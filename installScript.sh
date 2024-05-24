#!/bin/bash

# Function to check the last command status and exit if it failed
check_command_status() {
    if [ $? -ne 0 ]; then
        echo "Error: $1"
        exit 1
    fi
}

# Update package database and install packages
sudo pacman -Sy
check_command_status "Failed to update package database."

sudo pacman -S --noconfirm sddm wayland hyprland waybar dunst rofi zsh thunar alacritty python python-pywal firefox
check_command_status "Failed to install some packages."

# Check if the packages were installed successfully
if pacman -Qi sddm wayland hyprland waybar dunst rofi zsh thunar alacritty python python-pywal > /dev/null; then
    echo "Pacman packages installed successfully."
else
    echo "Pacman failed to install some packages."
    exit 1
fi

# Delete original configuration files if they exist
sudo rm -f ~/.config/rofi/config.rasi
check_command_status "Failed to delete ~/.config/rofi/config.rasi."

sudo rm -f ~/.config/hypr/hyprland.conf
check_command_status "Failed to delete ~/.config/hypr/hyprland.conf."

sudo rm -f ~/.config/waybar/config
check_command_status "Failed to delete ~/.config/waybar/config."

sudo rm -f ~/.config/waybar/launch.sh
check_command_status "Failed to delete ~/.config/waybar/launch.sh."

sudo rm -f ~/.config/waybar/style.css
check_command_status "Failed to delete ~/.config/waybar/style.css."

sudo rm -f ~/.config/dunst/dunstrc
check_command_status "Failed to delete ~/.config/dunst/dunstrc."

sudo rm -f ~/.config/alacritty/alacritty.toml
check_command_status "Failed to delete ~/.config/alacritty/alacritty.toml."

sudo rm -f ~/.bashrc
check_command_status "Failed to delete ~/.bashrc."

sudo rm -f ~/.gitconfig
check_command_status "Failed to delete ~/.gitconfig."

# Ensure target directories exist
mkdir -p ~/.config/wal/templates
check_command_status "Failed to create directory ~/.config/wal/templates."

mkdir -p ~/scripts
check_command_status "Failed to create directory ~/scripts."

# Copy necessary files
cp -r scripts ~/scripts
check_command_status "Failed to copy scripts directory to ~/scripts."

cp pywal/colors.yml ~/.config/wal/templates/colors.yml
check_command_status "Failed to copy pywal/colors.yml."

cp pywal/colors-hyprland.conf ~/.config/wal/templates/colors-hyprland.conf
check_command_status "Failed to copy pywal/colors-hyprland.conf."

cp pywal/colors-rofi-dark.rasi ~/.config/wal/templates/colors-rofi-dark.rasi
check_command_status "Failed to copy pywal/colors-rofi-dark.rasi."

# Create symbolic links
ln -sf ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
check_command_status "Failed to create symlink for alacritty.toml."

ln -sf ~/.dotfiles/dunstrc ~/.config/dunst/dunstrc
check_command_status "Failed to create symlink for dunstrc."

ln -sf ~/.dotfiles/config.rasi ~/.config/rofi/config.rasi
check_command_status "Failed to create symlink for config.rasi."

ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
check_command_status "Failed to create symlink for .gitconfig."

ln -sf ~/.dotfiles/.bashrc ~/.bashrc
check_command_status "Failed to create symlink for .bashrc."

ln -sf ~/.dotfiles/hyprland/hyprland.conf ~/.config/hypr/hyprland.conf
check_command_status "Failed to create symlink for hyprland.conf."

ln -sf ~/.dotfiles/waybar/config ~/.config/waybar/config
check_command_status "Failed to create symlink for waybar config."

ln -sf ~/.dotfiles/waybar/launch.sh ~/.config/waybar/launch.sh
check_command_status "Failed to create symlink for waybar launch.sh."

ln -sf ~/.dotfiles/waybar/style.css ~/.config/waybar/style.css
check_command_status "Failed to create symlink for waybar style.css."

echo "Configuration files copied and symlinks created successfully."

