#!/usr/bin/env ruby

require 'FileUtils'

files_to_link = {
	"~/dotfiles/git/gitconfig" => "~/.gitconfig",
	"~/dotfiles/git/gitignore_global" => "~/.gitignore_global",

	"~/dotfiles/tmux/tmux.conf" => "~/.tmux.conf",

	"~/dotfiles/vim/vim" => "~/.vim",
	"~/dotfiles/vim/vimrc" => "~/.vimrc",
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

files_to_create = {
	 "~/.zshrc" => "source ~/dotfiles/zsh/oh_my_zsh_rc\n\n# Customize the path as you need\nexport PATH=$PATH\n\n# Import ssh identities for this machine\nssh-add ~/.ssh/id_rsa",
   "~/.aliases" => "source ~/dotfiles/zsh/aliases"
}

files_to_create.each do |target, content|
	target = File.expand_path(target)

	if File.exists? target
		puts "Skipping #{target} since a file already exists there"
		next
	end

  File.open(target, 'w') { |file| file.write(content) }
end
