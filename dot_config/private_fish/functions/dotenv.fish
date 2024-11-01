function __check_pwd --on-variable PWD --description "Check if the PWD has changed"
	status --is-command-substitution; and return
	dotenv
end

function dotenv --description "Add contents of .env file to environment if present in directory"
	if ! test -e .env
		return
	end

	while read --nchars 1 -l response --prompt-str="dotenv: found .env: source it? ([Y]es/[n]o/[a]lways/n[e]ver)"
			or return 1
		switch $response
			case y Y
				set_env
			case n N
				return 0
			case a A e E
				#TODO: handle this
				return 0
			case "*"
				continue
		end
	end
end

function set_env --description "Set variables in a .env file as global variables in fish"
	for line in $(cat .env)
		set -f values $(string split = $line)
		set -g $values[1] $values[2]
	end
end
