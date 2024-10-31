function dotfiles
	if ! type -q chezmoi
		return 1
	end

	if ! type -q git
		return 1
	end

	command chezmoi git pull origin trunk
	command chezmoi apply -v
end
