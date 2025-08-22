local plugins = {}

-- Load all plugin files
local plugin_files = {
	"neo-tree",
	"treesitter",
	"formatting",
	"completion",
	"autopairs",
	"snacks",
	"nvim-ufo",
	"context",
	"markdown",
	"multicursors",
	"smart-splits",
	"themes",
	"lualine",
	"_misc",
}

for _, file in ipairs(plugin_files) do
	local plugin_config = require("plugins." .. file)
	for _, plugin in ipairs(plugin_config) do
		table.insert(plugins, plugin)
	end
end

return plugins
