return {
	{
		"RRethy/base16-nvim",
		priority = 1000,
		config = function()
			require('base16-colorscheme').setup({
				base00 = '#141315',
				base01 = '#141315',
				base02 = '#82808b',
				base03 = '#82808b',
				base04 = '#d5d3e0',
				base05 = '#f9f8ff',
				base06 = '#f9f8ff',
				base07 = '#f9f8ff',
				base08 = '#ff9fb4',
				base09 = '#ff9fb4',
				base0A = '#dddbeb',
				base0B = '#a5ffb7',
				base0C = '#f6f5ff',
				base0D = '#dddbeb',
				base0E = '#f2f0ff',
				base0F = '#f2f0ff',
			})

			vim.api.nvim_set_hl(0, 'Visual', {
				bg = '#82808b',
				fg = '#f9f8ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Statusline', {
				bg = '#dddbeb',
				fg = '#141315',
			})
			vim.api.nvim_set_hl(0, 'LineNr', { fg = '#82808b' })
			vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#f6f5ff', bold = true })

			vim.api.nvim_set_hl(0, 'Statement', {
				fg = '#f2f0ff',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Keyword', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Repeat', { link = 'Statement' })
			vim.api.nvim_set_hl(0, 'Conditional', { link = 'Statement' })

			vim.api.nvim_set_hl(0, 'Function', {
				fg = '#dddbeb',
				bold = true
			})
			vim.api.nvim_set_hl(0, 'Macro', {
				fg = '#dddbeb',
				italic = true
			})
			vim.api.nvim_set_hl(0, '@function.macro', { link = 'Macro' })

			vim.api.nvim_set_hl(0, 'Type', {
				fg = '#f6f5ff',
				bold = true,
				italic = true
			})
			vim.api.nvim_set_hl(0, 'Structure', { link = 'Type' })

			vim.api.nvim_set_hl(0, 'String', {
				fg = '#a5ffb7',
				italic = true
			})

			vim.api.nvim_set_hl(0, 'Operator', { fg = '#d5d3e0' })
			vim.api.nvim_set_hl(0, 'Delimiter', { fg = '#d5d3e0' })
			vim.api.nvim_set_hl(0, '@punctuation.bracket', { link = 'Delimiter' })
			vim.api.nvim_set_hl(0, '@punctuation.delimiter', { link = 'Delimiter' })

			vim.api.nvim_set_hl(0, 'Comment', {
				fg = '#82808b',
				italic = true
			})

			local current_file_path = vim.fn.stdpath("config") .. "/lua/plugins/dankcolors.lua"
			if not _G._matugen_theme_watcher then
				local uv = vim.uv or vim.loop
				_G._matugen_theme_watcher = uv.new_fs_event()
				_G._matugen_theme_watcher:start(current_file_path, {}, vim.schedule_wrap(function()
					local new_spec = dofile(current_file_path)
					if new_spec and new_spec[1] and new_spec[1].config then
						new_spec[1].config()
						print("Theme reload")
					end
				end))
			end
		end
	}
}
