#!/bin/bash

# Create ~/.config directory if it doesn't exist
mkdir -p ~/.config

# Files to symlink (source => target)
declare -A files_to_link=(
    ["~/dotfiles/git/gitconfig"]="~/.gitconfig"
    ["~/dotfiles/git/gitignore_global"]="~/.gitignore_global"
    ["~/dotfiles/tmux/tmux.conf"]="~/.tmux.conf"
    ["~/dotfiles/zsh/starship.toml"]="~/.config/starship.toml"
    ["~/dotfiles/ffmpeg"]="~/.ffmpeg"
    ["~/dotfiles/nvim"]="~/.config/nvim"
    ["~/dotfiles/vim/vim"]="~/.vim"
    ["~/dotfiles/vim/vimrc"]="~/.vimrc"
)

# Create symlinks
for source in "${!files_to_link[@]}"; do
    target="${files_to_link[$source]}"
    
    # Expand tilde paths
    source_expanded="${source/#\~/$HOME}"
    target_expanded="${target/#\~/$HOME}"
    
    if [[ -L "$target_expanded" ]]; then
        echo "Removing symlink at $target_expanded"
        rm "$target_expanded"
    elif [[ -e "$target_expanded" ]]; then
        echo "Skipping $target_expanded since a file already exists there"
        continue
    fi
    
    ln -s "$source_expanded" "$target_expanded"
done

# Files to create with content
declare -A files_to_create=(
    ["~/.zshrc"]="# Customize the path as you need
export PATH=\$PATH:$HOME/bin

source ~/dotfiles/zsh/zshrc

# Import ssh identities for this machine
ssh-add ~/.ssh/id_rsa"
    ["~/.aliases"]="source ~/dotfiles/zsh/aliases"
)

# Create files with content
for target in "${!files_to_create[@]}"; do
    content="${files_to_create[$target]}"
    target_expanded="${target/#\~/$HOME}"
    
    if [[ -e "$target_expanded" ]]; then
        echo "Skipping $target_expanded since a file already exists there"
        continue
    fi
    
    echo "$content" > "$target_expanded"
done 