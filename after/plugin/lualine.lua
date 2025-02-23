require("lualine").setup({
	options = {
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch" },
		lualine_c = {
			{ "filename", path = 1 }, -- Add this line for relative path
		},
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = {
			"location",
			{
				function()
					return " " .. os.date("%H:%M:%S") -- Clock icon + Time
				end,
				color = function()
					local hour = tonumber(os.date("%H"))
					if hour < 6 then
						return { fg = "#ff5555", bg = "#222222", gui = "bold" } -- Midnight (Red)
					elseif hour < 12 then
						return { fg = "#fab387", bg = "#222222", gui = "bold" } -- Morning (Orange)
					elseif hour < 18 then
						return { fg = "#89b4fa", bg = "#222222", gui = "bold" } -- Afternoon (Blue)
					else
						return { fg = "#cba6f7", bg = "#222222", gui = "bold" } -- Evening/Night (Purple)
					end
				end,
			},
		},
	},
})
