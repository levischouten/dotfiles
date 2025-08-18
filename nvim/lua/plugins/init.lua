local plugins = {}

-- Load all plugin files
local plugin_files = {
	"lualine",
	"neo-tree",
	"fzf-lua",
	"treesitter",
	"formatting",
	"completion",
	"autopairs",
	"snacks",
	"nvim-ufo",
	"context",
	"multicursors",
	"smart-splits",
	"_misc",
	"themes",
}

for _, file in ipairs(plugin_files) do
	local plugin_config = require("plugins." .. file)
	for _, plugin in ipairs(plugin_config) do
		table.insert(plugins, plugin)
	end
end

return plugins
