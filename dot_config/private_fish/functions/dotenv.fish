function __check_pwd --on-variable PWD --description "Check if the PWD has changed"
	status --is-command-substitution; and return
	dotenv
end

function dotenv --description "Add contents of .env file to environment if present in directory"
	if ! test -e .env
		return
	end

	for line in $(cat .env); do
		echo $line
	end
end

