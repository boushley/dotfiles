#!/usr/bin/env ruby

require 'FileUtils'

files_to_link = {
	"~/.dotfiles/git/gitconfig" => "~/.gitconfig",
	"~/.dotfiles/git/gitignore_global" => "~/.gitignore_global",
	"~/.dotfiles/tmux/tmux.conf" => "~/.tmux.conf",
	"~/.dotfiles/vim/vim" => "~/.vim",
	"~/.dotfiles/vim/vimrc" => "~/.vimrc",
	"~/.dotfiles/zsh/oh_my_zsh_rc" => "~/.zshrc",

	"~/.dotfiles/git/gitconfig" => "~/.gitconfig",
	"~/.dotfiles/git/gitignore_global" => "~/.gitignore_global",

	"~/.dotfiles/tmux/tmux.conf" => "~/.tmux.conf",

	"~/.dotfiles/vim/vim" => "~/.vim",
	"~/.dotfiles/vim/vimrc" => "~/.vimrc",

	"~/.dotfiles/zsh/oh_my_zsh_rc" => "~/.zshrc"
}

files_to_link.each do |source, target|
	source = File.expand_path(source)
	target = File.expand_path(target)

	if File.symlink? target
		puts "Removing symlink at #{target}"
		FileUtils.rm target
	elsif File.exists? target
		puts "Skipping #{target} since a file already exists there"
		next
	end

	FileUtils.ln_s(source, target)
end
