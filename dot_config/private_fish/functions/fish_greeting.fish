function fish_greeting
	echo "Welcome to $(set_color brred)$(hostnamectl hostname)$(set_color normal)!"
	echo "Uptime: $(uptime -p)"
end
