#!/bin/bash

# installs scoop if it isn't already installed
install_or_update_scoop() {
    if ! command -v scoop &>/dev/null; then
        echo "[!] scoop not found. installing..."
        powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope CurrentUser; iex (new-object net.webclient).downloadstring('https://get.scoop.sh')"
    else
        echo "[i] scoop is already installed. updating..."
        scoop update
    fi
}

# install apps in a category
install_apps() {
    local category=$1
    shift
    echo -e "\n[?] do you want to install apps in the '$category' category? (y/n)"
    echo "apps: $*"
    read -r response
    if [[ "$response" == "y" ]]; then
        for app in "$@"; do
            echo "[→] installing $app..."
            scoop install "$app"
        done
    else
        echo "[>] skipping '$category' category."
    fi
}

# apps sorted in categories
system_apps=(7zip vcredist2022 wget winrar-np powertoys)
dev_tools=(git neovim neovide vscode sublime-text lazygit nvm nodejs python make mingw gcc sass)
browsers=(brave googlechrome firefox-nightly min)
media_tools=(ffmpeg mpv)
terminals=(alacritty wezterm windows-terminal-preview)
fonts=(JetBrains-Mono JetBrainsMono-NF JetBrainsMono-NF-Mono)
utilities=(fzf bat fd eza lsd glow zoxide oh-my-posh tor chromedriver)
other_apps=(libreoffice localsend telegram spotify notion xnview mp3tag winaero-tweaker mods rio ttyd charm-gum)

install_or_update_scoop # ensure scoop is installed or updated

# Install apps by category
install_apps "system apps" "${system_apps[@]}"
install_apps "development tools" "${dev_tools[@]}"
install_apps "browsers" "${browsers[@]}"
install_apps "media tools" "${media_tools[@]}"
install_apps "terminals" "${terminals[@]}"
install_apps "fonts" "${fonts[@]}"
install_apps "utilities" "${utilities[@]}"
install_apps "other apps" "${other_apps[@]}"

echo -e "\n[*] all categories processed."
