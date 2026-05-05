#!/bin/bash 
# ======================================================================================
# MASTER ARCH LINUX SETUP: ZEN 4 (V4) 
# TARGET CPU: AMD Ryzen 7 8845HS (AVX-512 Supported) 
# STRATEGY: Enable CachyOS V4 Repos -> Install Kernel -> Install Paru -> Install Apps 
# ======================================================================================

# ⚠️ CONFIGURATION: CHANGE THIS TO YOUR USERNAME ⚠️ 
USERNAME="mayank" 

# ========================================== 
# 1. INSTALL KERNEL & BASE 
# ========================================== 
echo "🐧 Installing Optimized Kernel..." 
# 'linux-cachyos' includes EEVDF scheduler tweaks for Ryzen
pacman -S systemd-ukify limine-mkinitcpio-hook limine-entry-tool limine-snapper-sync
pacman -S scx-tools scx-scheds scx-manager scxctl
# Ensure base-devel is present 
pacman -S base-devel amd-ucode

# ========================================== 
# 2. INSTALL SOFTWARE STACK 
# ========================================== 
echo "💿 Installing Software Stack (V4 Optimized)..."
 
# switch to user for paru commands (safer)
su - $USERNAME <<EOF
    
    echo "💿 Installing Graphics Stack..."
    # Mesa & Vulkan Graphics Stack
    paru -S --noconfirm mesa vulkan-radeon libva-mesa-driver mesa-vdpau vulkan-icd-loader
    #paru -S --noconfirm lib32-mesa lib32-vulkan-radeon lib32-libva-mesa-driver lib32-mesa-vdpau
    
    echo "💿 Installing GNOME Apps..."
    # GNOME APPS (gtk based)
    paru -S --noconfirm nautilus python-nautilus nautilus-open-any-terminal nautilus-admin bubblewrap
    #paru -S --noconfirm gvfs gvfs-mtp gvfs-goa gvfs-google gvfs-onedrive sushi-git udiskie
    #paru -S --noconfirm gnome-disk-utility gnome-firmware gnome-calculator gnome-keyring
    #paru -S --noconfirm keypunch resources tangram baobab loupe cine papers snapshot foliate
    #paru -S --noconfirm helvum commit dialect junction sessions pods boxes
	
	echo "💿 Installing Apps..."
	# APPS
	paru -S --noconfirm zen-browser-bin clipse bleachbit
	#paru -S --noconfirm ventoy shelly localsend-bin
	#paru -S --noconfirm cameractrls obsidian file-roller
	#paru -S --noconfirm zathura zathura-pdf-mupdf mupdf-tools 
	#paru -S --noconfirm czkawka-gui himalaya-git
	#paru -S --noconfirm taskbook-bin onlyoffice-bin neomutt-git
	#paru -S --noconfirm satty deskreen-bin trash-cli peazip sioyek jamesdsp 
	
	echo "💿 Installing System Utilities Apps..."
	# System Utilites APPS
	#paru -S --noconfirm networkmanager nmgui-bin iwgtk overskride-bin
	paru -S --noconfirm iwd wifitui impala
	paru -S --noconfirm bluez bluez-utils bluetui
	paru -S --noconfirm brightnessctl power-profiles-daemon
	paru -S --noconfirm zram-generator btrfs-progs smartmontools
	paru -S --noconfirm qdiskinfo amdgpu_top fwupd snapper
	paru -S --noconfirm btrfs-assistant uv opensnitch hwinfo
	#paru -S --noconfirm virt-manager cups cups-pdf howdy-git firewalld firewall-config
	# wl-gammarelay-rs wl-gammarely-applet tuil
	
	#containers and inference runtime
    #paru -S --noconfirm docker podman-desktop podman k9s 
    #paru -S --noconfirm opencode-bin claude-code llama.cpp-vulkan ollama-vulkan alpaca
	
	echo "💿 Installing Cachyos Apps..."
	# Cachyos APPS
	paru -S cachyos-hooks ananicy-cpp cachyos-ananicy-rules
	paru -S cachyos-sysctl-manager cachyos-snapper-support
	#paru -S --noconfirm wine-cachyos proton-cachyos
    
	echo "💿 Installing Shell and Terminal Stack..."
	# --- SHELL & TERMINAL --- 
	paru -S --noconfirm fish foot ghostty micro neovim superfile glow
	paru -S --noconfirm procs fastfetch btop battop lazygit zellij stow unrar unzip wget curl 
	paru -S --noconfirm eza bat zoxide ripgrep fd sd dust atuin tealdeer man-db man-pages yazi
	paru -S --noconfirm gcc cmake pacman-contrib nvme-cli github-cli dog
	#paru -S --noconfirm visual-studio-code-bin vscodium-bin zed pure
	#paru -S --noconfirm rsync yt-dlp starship neovide taskwarrior-tui
	
	# Install Fisher
	#curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

	# Install Tide
	#fisher install IlanCosman/tide@v6

	#btop theme
	#mkdir -p ~/.config/btop/themes
	#curl -Lo ~/.config/btop/themes/catppuccin_mocha.theme https://raw.githubusercontent.com/catppuccin/btop/main/themes/catppuccin_mocha.theme

	#lazyvim
	git clone https://github.com/LazyVim/starter ~/.config/nvim
	rm -rf ~/.config/nvim/.git

	#yazi
	#ya pkg add yazi-rs/flavors:catppuccin-mocha
	#printf '[flavor]\ndark = "catppuccin-mocha"\nlight = "catppuccin-mocha"\n' > ~/.config/yazi/theme.toml

	#micro
	#mkdir -p ~/.config/micro/colorschemes
	#curl -o ~/.config/micro/colorschemes/catppuccin-mocha.micro https://raw.githubusercontent.com/catppuccin/micro/main/themes/catppuccin-mocha.micro
	
	echo "💿 Installing Audio Stack..."
	# --- AUDIO --- 
	paru -S --noconfirm pipewire pipewire-alsa pipewire-pulse wireplumber pwvucontrol playerctl
	#paru -S --noconfirm mpv mpv-uosc-git mpv-thumbfast-git mpv-mpris webp-pixbuf-loader lsp-plugins qpwgraph
	#paru -S --noconfirm gstreamer gst-plugins-base gst-plugin-pipewire gst-plugins-rs gst-libav gst-plugin-gtk4 gst-plugins-bad gst-plugins-ugly
	#https://github.com/zydezu/ModernX
	paru -S --noconfirm ffmpeg ffmpegthumbnailer
	
	echo "💿 Installing Themes and Fonts..."
	# --- THEMES & FONTS --- 
	paru -S --noconfirm ttf-jetbrains-mono-nerd ttf-font-awesome noto-fonts-emoji ttf-material-symbols-variable-git 
	paru -S --noconfirm ttf-cascadia-code-nerd ttf-meslo-nerd noto-fonts inter-font
	paru -S --noconfirm catppuccin-gtk-theme-mocha papirus-icon-theme bibata-cursor-theme-bin 
	paru -S --noconfirm kvantum qt5-wayland qt6-wayland qt5ct qt6ct adw-gtk3
	
	echo "💿 Installing Niri Ecosystem..."
	# --- NIRI TOOLS--- 
	paru -S --noconfirm niri xwayland-satellite xdg-desktop-portal-gnome xdg-desktop-portal-gtk xdg-utils
	paru -S --noconfirm polkit polkit-gnome xorg-xwayland mako awww nwg-drawer
	paru -S --noconfirm hypridle hyprlock hyprsunset wlogout-git waybar
	paru -S --noconfirm nwg-look wdisplays wayland-pipewire-idle-inhibit
	#paru -S --noconfirm hyprpolkitagent uwsm
	
	echo "💿 Installing Hypr Ecosystem..."
	# --- HYPR TOOLS---
	#paru -S --noconfirm hyprland hyprpaper hyprpolkitagent hypridle hyprlock hyprsunset hyprshot hyprpicker hyprcursor 
	#paru -S --noconfirm uwsm libnewt aquamarine xdg-desktop-portal-hyprland xdg-desktop-portal-gtk xorg-xwayland nwg-drawer
	#paru -S --noconfirm nwg-look nwg-dock-hyprland wdisplays mako wlogout-git snappy-switcher hyprkcs-git hyprgraphics
	#paru -S --noconfirm waybar wayland-pipewire-idle-inhibit hyprland-qt-support hyprqt6engine hyprshutdown hyprpwcenter
	
EOF

# ==========================================
# 5. Set Shell to Fish
# ==========================================
echo "Making Fish default shell..."
chsh -s /usr/bin/fish $USERNAME

# ==========================================
# 6. ENABLE SYSTEM SERVICES
# ==========================================
echo "🔌 Enabling System Services..."
#sudo systemctl enable --now NetworkManager
sudo systemctl enable --now iwd
sudo systemctl enable --now bluetooth
sudo systemctl enable --now power-profiles-daemon
#sudo systemctl enable --now firewalld
sudo systemctl enable --now fstrim.timer
sudo systemctl enable --now snapper-timeline.timer # Btrfs Snapshots
sudo systemctl enable --now snapper-cleanup.timer
sudo systemctl enable --now paccache.timer # Clean cache
sudo systemctl enable --now systemd-timesyncd
sudo systemctl enable --now fwupd
sudo systemctl enable --now reflector.timer
sudo systemctl enable --now ananicy-cpp
sudo systemctl enable --now cachyos-ksm
sudo systemctl enable --now scx.service
sudo systemctl enable --now cachyos-rate-mirrors.timer
sudo systemctl enable --now pipewire 
sudo systemctl enable --now pipewire-pulse 
sudo systemctl enable --now wireplumber
sudo systemctl enable --now systemd-resolved
#sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
sudo tldr --update

echo "✅ Master Setup Complete! Type 'exit' and reboot."