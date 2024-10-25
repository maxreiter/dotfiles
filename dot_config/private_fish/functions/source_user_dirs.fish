function source_user_dirs
	set -f config $XDG_CONFIG_HOME
	if test -z $config
		set -f config "$HOME/.config"
	end

	set -f user_dirs "$config/user-dirs.dirs"
	if ! test -e $user_dirs
		return 1
	end

	set -f dirs $(cat $user_dirs)
	for line in $dirs
		if test $(string sub --length 1 $line) = "#"
			continue
		end

		set -f split $(string split = $line)
		if test -z $split[1]; or test -z $split[2]
			continue
		end

		set -f value $(string replace -a '"' "" $split[2])
		set value $(string replace -a '$HOME' $HOME $value)

		set -g $split[1] $value
	end

end
