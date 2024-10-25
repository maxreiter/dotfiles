#!/bin/fish

function play
	set -f cmd "/usr/bin/play"
	if ! type -q $cmd
		return
	end

	set -f music_dir "$XDG_MUSIC_DIR/notification"
	if test -d $music_dir; and test -e $music_dir
		set -f file "$music_dir/fart.wav"
		if test -f $file; and test -e $file
			command $cmd -q $file
		end
	end
end

function notify
	set -f cmd "/usr/bin/notify-send"
	if ! type -q $cmd
		return
	end

	play
	command $cmd $argv
end

if ! test -d $XDG_PICTURES_DIR; or ! test -e $XDG_PICTURES_DIR
	notify "XDG_PICTURES_DIR is not set"
end

set -l screenshot_dir "$XDG_PICTURES_DIR/screenshots"
if ! test -d $screenshot_dir; or ! test -e $screenshot_dir
	mkdir -p $screenshot_dir
end

set -l filename "$(date +'%Y-%m-%d-%H%M%s').png"
set -l output_path $(path normalize "$screenshot_dir/$filename")

grim -g $(slurp -d) $output_path

if ! test -e $output_path
	return 0
end

wl-copy < $output_path
notify -i $output_path "Screenshot copied to clipboard & saved to $filename"

