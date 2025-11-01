#!/bin/bash

# Exit on error
set -e

#kill annoyment
pgrep -f gnome-initial-setup && pkill -f gnome-initial-setup
touch    "$HOME/.config/gnome-initial-setup-done" #so gnome's autostart login won't launch gnome-initial-setup when this files exists.
pkill -f update-notifier >/dev/null 2>&1 || true
pkill -f gnome-initial-s >/dev/null 2>&1 || true
pkill -f check-new-release-gtk >/dev/null 2>&1 || true

#gnome settings
echo "upgrading settings"
mkdir -p ~/.config/autostart
cp /etc/xdg/autostart/update-notifier.desktop ~/.config/autostart/
sed -i 's/^Exec=.*/Exec=/' ~/.config/autostart/update-notifier.desktop
echo 'Hidden=true' >> ~/.config/autostart/update-notifier.desktop

powerprofilesctl set performance
gsettings set org.gnome.shell favorite-apps "['code.desktop', 'firefox_firefox.desktop', 'org.gnome.Terminal.desktop']" >/dev/null 2>&1
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false >/dev/null 2>&1
amixer set Master mute 1>/dev/null
bluetoothctl power off >/dev/null 2>&1 || true

gsettings set org.gnome.desktop.screensaver idle-activation-enabled false >/dev/null 2>&1
gsettings set org.gnome.system.location enabled false >/dev/null 2>&1
gsettings set org.gnome.desktop.interface clock-show-seconds true >/dev/null 2>&1
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'toggle-maximize' >/dev/null 2>&1
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize' >/dev/null 2>&1
# gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:' >/dev/null 2>&1 #move window buttons to left
# its revert: gsettings reset org.gnome.desktop.wm.preferences button-layout
gsettings set org.gnome.settings-daemon.plugins.power sleep-inactive-ac-type 'nothing' >/dev/null 2>&1
gsettings set org.gnome.shell.extensions.dash-to-dock show-trash false >/dev/null 2>&1
gsettings set com.ubuntu.update-notifier no-show-notifications true >/dev/null 2>&1
gsettings set com.ubuntu.update-notifier show-apport-crashes false >/dev/null 2>&1
gsettings set org.gnome.desktop.notifications show-in-lock-screen false >/dev/null 2>&1
gsettings set org.gnome.desktop.sound event-sounds false >/dev/null 2>&1
gsettings set org.gnome.desktop.notifications show-banners true >/dev/null 2>&1 #do not disturb ON for the alarm
gsettings set com.ubuntu.update-notifier no-show-notifications true >/dev/null 2>&1

#privacy
gsettings set org.gnome.desktop.privacy remove-old-temp-files true >/dev/null 2>&1
gsettings set org.gnome.desktop.privacy send-software-usage-stats false >/dev/null 2>&1
gsettings set org.gnome.desktop.privacy remove-old-trash-files true >/dev/null 2>&1
gsettings set org.gnome.desktop.privacy report-technical-problems false >/dev/null 2>&1
gsettings set org.gnome.nm-applet disable-disconnected-notifications true >/dev/null 2>&1
# gsettings set org.gnome.desktop.search-providers disable-external true >/dev/null 2>&1
gsettings set org.gnome.desktop.remote-desktop.rdp enable false >/dev/null 2>&1
gsettings set org.gnome.system.location enabled false >/dev/null 2>&1
gsettings set org.gnome.login-screen disable-user-list true >/dev/null 2>&1
gsettings set org.gnome.desktop.privacy remember-recent-files false >/dev/null 2>&1

xdg-settings set default-web-browser firefox.desktop >/dev/null 2>&1
cp $HOME/loadout/.vimrc $HOME/.vimrc

#gnome-terminal
profile_id=$(gsettings get org.gnome.Terminal.ProfilesList default 2>/dev/null | tr -d \')
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile_id/" use-custom-command true >/dev/null 2>&1
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile_id/" custom-command 'bash --login' >/dev/null 2>&1

base_path="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile_id/"
gsettings set "$base_path" use-theme-colors false >/dev/null 2>&1
gsettings set "$base_path" use-system-font false >/dev/null 2>&1
gsettings set "$base_path" background-color '#1D1F21' >/dev/null 2>&1
gsettings set "$base_path" foreground-color '#C5C8C6' >/dev/null 2>&1
gsettings set "$base_path" palette "['#000000', '#DC322F', '#859900', '#B58900', '#268BD2', '#D33682', '#2AA198', '#EEE8D5', '#002B36', '#CB4B16', '#586E75', '#657B83', '#839496', '#6C71C4', '#93A1A1', '#FDF6E3']" >/dev/null 2>&1
gsettings set "$base_path" use-theme-transparency false >/dev/null 2>&1

curl -L -s -o $HOME/blur-my-shell.zip https://extensions.gnome.org/extension-data/blur-my-shellaunetx.v42.shell-extension.zip
rm -rf $HOME/.local/share/gnome-shell/extensions/blur-my-shell@aunetx
mkdir -p $HOME/.local/share/gnome-shell/extensions
unzip -q $HOME/blur-my-shell.zip -d $HOME/.local/share/gnome-shell/extensions/blur-my-shell@aunetx
if ! gnome-extensions enable blur-my-shell@aunetx; then
  echo "Extension enable failed: blur-my-shell@aunetx"
fi

rm $HOME/blur-my-shell.zip

# install fonts
echo "installing fonts..."
mkdir -p $HOME/.local/share/fonts

cp -r $HOME/loadout/fonts/JetBrains/*.ttf $HOME/.local/share/fonts
cp -r $HOME/loadout/fonts/0xProto/*.ttf $HOME/.local/share/fonts
cp -r $HOME/loadout/fonts/Iosevka/*.ttc $HOME/.local/share/fonts

# refresh font cache
echo "refreshing font cache..."
fc-cache -fv >/dev/null 2>&1

gsettings set org.gnome.desktop.interface font-name 'iosevka 12.5' >/dev/null 2>&1
gsettings set org.gnome.desktop.interface document-font-name 'iosevka 13' >/dev/null 2>&1
gsettings set org.gnome.desktop.interface monospace-font-name 'iosevka 13' >/dev/null 2>&1
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'iosevka Bold 13' >/dev/null 2>&1
gsettings set "$base_path" font 'iosevka 14' >/dev/null 2>&1

#restart the portal in case firefox is installed via Snap/Flatpak
systemctl --user restart xdg-desktop-portal xdg-desktop-portal-gnome 2>/dev/null || \
systemctl --user restart xdg-desktop-portal xdg-desktop-portal-gtk

DOTFILES_LOADER_PATH="$HOME/loadout"
# clone dotfiles repo
if [ ! -d "$DOTFILES_LOADER_PATH" ]; then
  echo "cloning loadout..."
  git clone https://github.com/kofeeJuice/loadout.git "$DOTFILES_LOADER_PATH" >/dev/null 2>&1
fi

#wallpaper
wget -qO /tmp/wall.jpg https://ntbg.app/
wget -qO /tmp/wall-dark.jpg https://ntbg.app/
gsettings set org.gnome.desktop.background picture-uri "file:///tmp/wall.jpg" >/dev/null 2>&1
gsettings set org.gnome.desktop.background picture-uri-dark "file:///tmp/wall-dark.jpg" >/dev/null 2>&1

#bash config
echo "bash config..."

COMMON_SHELL_RC="$HOME/.shell_common"
cp "$HOME/loadout/.shell_common" "$COMMON_SHELL_RC"

append_source_if_missing() {
  local shell_rc="$1"
  if [ -f "$shell_rc" ]; then
    grep -qF "$COMMON_SHELL_RC" "$shell_rc" || echo "source $COMMON_SHELL_RC" >> "$shell_rc"
  fi
}

append_source_if_missing "$HOME/.bashrc"
append_source_if_missing "$HOME/.zshrc"

#remove any line starting with 'PS1=' first
sed -i '/^PS1=/d' "$HOME/.bashrc" && \
printf "%s\n" "PS1='\n\[\e[1;32m\]\w\[\e[0m\]\n❯ '" >> "$HOME/.bashrc" && \
source "$HOME/.bashrc"

# Don’t log bash history (per session)
# echo 'export HISTSIZE=0'      >> ~/.bashrc #clear shell history per terminal session
# echo 'export HISTFILE=/dev/null' >> ~/.bashrc #no shell history is saved on terminal close!
# echo 'history -c' >> ~/.bash_logout #clear shell history on logout

source $HOME/.bashrc

# Apply settings.json to VSCode & extensions
echo "vscode config..."
pkill -f 'code' >/dev/null 2>&1 || true
sleep 1 #wait a bit to ensure shutdown
VS_CODE_SETTINGS_FILE="${DOTFILES_LOADER_PATH}/vscode/settings.json"
mkdir -p $HOME/.config/Code/User
cat "${DOTFILES_LOADER_PATH}/vscode/keybindings.json" >>$HOME/.config/Code/User/keybindings.json
cp "$VS_CODE_SETTINGS_FILE" "$HOME/.config/Code/User/settings.json"

code --install-extension ritwickdey.LiveServer >/dev/null 2>&1 || true
code --install-extension golang.Go >/dev/null 2>&1 || true
code --install-extension PKief.material-product-icons >/dev/null 2>&1 || true
code --install-extension yy0931.vscode-sqlite3-editor >/dev/null 2>&1 || true
code --install-extension dbaeumer.vscode-eslint >/dev/null 2>&1 || true
code --install-extension esbenp.prettier-vscode >/dev/null 2>&1 || true
code --install-extension mhutchie.git-graph >/dev/null 2>&1 || true
code --install-extension rust-lang.rust-analyzer >/dev/null 2>&1 || true
code --install-extension tamasfe.even-better-toml >/dev/null 2>&1 || true
code --install-extension vscodevim.vim >/dev/null 2>&1 || true

#firefox config
echo "firefox config..."
rm -rf $HOME/user.js
firefox --headless 1 >/dev/null &>2 &
sleep 3
pkill firefox
git clone https://github.com/arkenfox/user.js.git $HOME/user.js >/dev/null 2>&1
PROFILE_DIR="$HOME/snap/firefox/common/.mozilla/firefox/$(grep -m 1 Path $HOME/snap/firefox/common/.mozilla/firefox/profiles.ini | cut -d'=' -f2)"
cp $HOME/user.js/user.js "$PROFILE_DIR/user.js"
cat $HOME/loadout/firefox/user-add.js >> "$PROFILE_DIR/user.js"

mkdir -p "$PROFILE_DIR/chrome"
rm -rf "$HOME/custom-firefox-css"
git clone https://github.com/datguypiko/Firefox-Mod-Blur.git "$HOME/custom-firefox-css" >/dev/null 2>&1
rm -rf "$PROFILE_DIR/chrome"/*
cp -r "$HOME/custom-firefox-css"/* "$PROFILE_DIR/chrome/"

mkdir -p "$PROFILE_DIR/extensions"
wget -q https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi -O ublock_origin.xpi
mv ublock_origin.xpi "$PROFILE_DIR/extensions/uBlock0@raymondhill.net.xpi"
wget -q "https://addons.mozilla.org/firefox/downloads/file/3729287/gruvboxgruvboxgruvboxgruvboxgr-1.0.xpi" -O "$PROFILE_DIR/extensions/{08d5243b-4236-4a27-984b-1ded22ce01c3}.xpi"
# mv gruvbox@theme.xpi "$PROFILE_DIR/extensions"

firefox "https://github.com/login" "https://auth.openai.com/" "https://www.discord.com/login" >/dev/null 2>&1 &

#apply lazyvim
echo "deploying lazyvim..."
mkdir -p $HOME/.config/nvim
cp -r "${DOTFILES_LOADER_PATH}/nvim" $HOME/.config/

echo "Done!"
