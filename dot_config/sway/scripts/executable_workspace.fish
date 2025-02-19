#!/bin/fish

for i in (seq 0 2)
	swaymsg exec foot
end

sleep 0.5
swaymsg focus left
swaymsg resize set width 65ppt
