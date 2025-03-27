-- Entrypoint for my neovim Lua config.
-- Settings are grouped in their own file in the lua directory.

-- Load global settings
require("global_setting")

-- Load local settings
require("local_setting")

-- Load plugins
require("plugin")

-- Load autocmds
require("autocmd")

-- Load keybinds
require("keybind")
