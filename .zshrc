# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set the theme (Oh My Zsh will load this automatically)
source ~/powerlevel10k/powerlevel10k.zsh-theme

# Standard and Custom plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# --- User configuration ---

alias nix-unfree="NIXPKGS_ALLOW_UNFREE=1 nix profile add --impure"

# Fix the Nix search path warning
export NIX_PATH=$HOME/.nix-defexpr/channels:/nix/var/nix/profiles/per-user/root/channels${NIX_PATH:+:$NIX_PATH}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# for yambar media controls
export XCURSOR_THEME=Adwaita
export XCURSOR_SIZE=24
export XCURSOR_PATH=$XCURSOR_PATH:~/.local/share/icons:~/.icons:/usr/share/icons
export XDG_DATA_DIRS="$HOME/.nix-profile/share:$XDG_DATA_DIRS:/usr/local/share:/usr/share"
alias nsync="~/nix-sync.sh"

BINDIR="${XDG_BIN_HOME:-$HOME/.local/bin}"

if ! echo $PATH | grep "$BINDIR" >/dev/null 2>&1; then
	export PATH="$PATH:$BINDIR"
fi

export PATH="/home/dunk/.bun/bin:$PATH"

# opencode
export PATH=/home/dunk/.opencode/bin:$PATH

# Proton VPN Aliases
alias vpnup='sudo wg-quick up proton'
alias vpndown='sudo wg-quick down proton'
alias vpnstat='sudo wg && curl -s https://ipinfo.io'

export PATH="$HOME/odin-compiler/odin:$PATH"


# Java Home
# Android SDK
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0
export PATH=$PATH:$ANDROID_HOME/emulator

# Java
export JAVA_HOME=/usr/lib/jvm/openjdk17
export PATH=$PATH:$JAVA_HOME/bin

# NDK
export ANDROID_NDK_HOME=$ANDROID_HOME/ndk-bundle
