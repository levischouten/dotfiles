local plugins = {}

-- Load all plugin files
local plugin_files = {
	"themes",
	"lualine",
	"nvim-tree",
	"fzf-lua",
	"treesitter",
	"formatting",
	"completion",
	"autopairs",
	"snacks",
    "multicursors",
	"_misc",
}

for _, file in ipairs(plugin_files) do
	local plugin_config = require("plugins." .. file)
	for _, plugin in ipairs(plugin_config) do
		table.insert(plugins, plugin)
	end
end

return plugins
