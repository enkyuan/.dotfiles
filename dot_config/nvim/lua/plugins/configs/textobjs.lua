return {
		"chrisgrieser/nvim-various-textobjs",
		config = function()
			require("various-textobjs").setup({
				-- lines to seek forwards for "small" textobjs (mostly characterwise textobjs)
   				-- lines to seek forwards for "big" textobjs (mostly linewise textobjs)
                -- set to 0 to only look in the current line
				forwardLooking = {
                    small = 5,
                    big = 15,
                },

				-- use suggested keymaps (see README)
				keymaps = {
                    useDefaults = true,

                    -- disable some default keymaps, e.g. { "ai", "ii" }
                    disabledKeymaps = {},
                },
			})
		end,
	}
