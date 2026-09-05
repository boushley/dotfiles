#!/bin/zsh

mkdir -p $HOME/.config
mkdir -p $HOME/.agents

# Files to symlink (source => target)
typeset -A files_to_link
files_to_link=(
    ["$HOME/dotfiles/git/gitignore_global"]="$HOME/.gitignore_global"
    ["$HOME/dotfiles/tmux/tmux.conf"]="$HOME/.tmux.conf"
    ["$HOME/dotfiles/zsh/starship.toml"]="$HOME/.config/starship.toml"
    ["$HOME/dotfiles/ffmpeg"]="$HOME/.ffmpeg"
    ["$HOME/dotfiles/nvim"]="$HOME/.config/nvim"
    ["$HOME/dotfiles/ghostty"]="$HOME/.config/ghostty"
    ["$HOME/dotfiles/vim/vim"]="$HOME/.vim"
    ["$HOME/dotfiles/vim/vimrc"]="$HOME/.vimrc"
    ["$HOME/dotfiles/elixir/iex.exs"]="$HOME/.iex.exs"
    ["$HOME/dotfiles/agent-skills"]="$HOME/.agents/skills"
)

# Create symlinks
for source in ${(k)files_to_link}; do
    target="${files_to_link[$source]}"
    
    if [[ -L "$target" ]]; then
        echo "Removing symlink at $target"
        rm "$target"
    elif [[ -e "$target" ]]; then
        echo "Skipping $target since a file already exists there"
        continue
    fi
    
    ln -s "$source" "$target"
done

# Files to create with content
typeset -A files_to_create
files_to_create=(
    ["$HOME/.gitconfig"]="[include]
    path = $HOME/dotfiles/git/gitconfig"
    ["$HOME/.zshrc"]="# Customize the path as you need
export PATH=\$PATH:\$HOME/bin

source ~/dotfiles/zsh/zshrc

# Import ssh identities for this machine
ssh-add \$HOME/.ssh/id_rsa"
    ["$HOME/.aliases"]="source \$HOME/dotfiles/zsh/aliases"
)

# Create files with content
for target in ${(k)files_to_create}; do
    content="${files_to_create[$target]}"
    
    # If switching .gitconfig from a symlink to a file
    if [[ "$target" == "$HOME/.gitconfig" && -L "$target" ]]; then
        echo "Removing symlink at $target to replace with file"
        rm "$target"
    fi

    if [[ -e "$target" ]]; then
        echo "Skipping $target since a file already exists there"
        continue
    fi
    
    echo "$content" > "$target"
done 
