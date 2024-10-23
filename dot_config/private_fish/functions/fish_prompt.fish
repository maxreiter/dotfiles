function fish_prompt
	echo "$(set_color brgreen)$(whoami):$(set_color normal) $(set_color brcyan)$(prompt_pwd -d 0)$(set_color normal) $(set_color brred)\$$(set_color normal) "
end
