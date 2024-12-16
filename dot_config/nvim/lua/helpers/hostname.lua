--- Helper class for matching a hostname.
-- Used for configuring settings based on hostname.
-- @classmod Hostname
-- @description Helper class for hostname matching.
local Hostname = {}

--- A collection of hostnames I frequently work at.
-- @field WORK hostname for work
-- @field HOME hostname for home
-- @table names
Hostname.names = {
	WORK = "D0384309DDD123",
	HOME = "KAIMAN",
}

--- Determines if a hostname matches based on location.
-- @param location the location to check
-- @treturn bool matches
Hostname.match = function(location)
	local hostname = vim.fn.hostname()
	local l = Hostname.names[string.upper(location)]
	if l ~= nil then
		return l == hostname
	end

	return false
end

--- Determines if the hostname matches work.
-- @treturn bool matches
Hostname.work = function()
	return Hostname.match("work")
end

--- Determines if the hostname matches home.
-- @treturn bool matches
Hostname.home = function()
	return Hostname.match("home")
end

return Hostname
