#!/bin/fish

set -f notify "notify-send"
if type -q $notify
	return 1
end

set -f options $(fish_opt -s p -l play)
argparse $options -- $argv

if test -z $argv
	return 1
end

set -f play 0
if set -q _flag_play
	set play 1
end

if test $play -eq 1
	set -f $cmd_base "play"
	if type -q $cmd_base
		set -f file_path "$XDG_MUSIC_DIR/notifications/fart.wav"
		if test -f $file_path; and test -e $file_path
			command "$cmd_base -q $file_path"
		end
	end
end

command "$notify $argv"

