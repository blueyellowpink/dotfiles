require('mini.cursorword').setup()
require('mini.surround').setup({
	mappings = {
		add = 'ma', -- Add surrounding in Normal and Visual modes
		delete = 'md', -- Delete surrounding
		find = 'mf', -- Find surrounding (to the right)
		find_left = 'mF', -- Find surrounding (to the left)
		highlight = 'mh', -- Highlight surrounding
		replace = 'mr', -- Replace surrounding
		update_n_lines = 'mn', -- Update `n_lines`

		suffix_last = 'l', -- Suffix to search with "prev" method
		suffix_next = 'n', -- Suffix to search with "next" method
	},
})
require('mini.pairs').setup()
require('mini.move').setup({
	mappings = {
		left = '<C-h>',
		right = '<C-l>',
		down = '<C-j>',
		up = '<C-k>',
	}
})
require('mini.comment').setup()
-- require('mini.statusline').setup()
require('mini.basics').setup()
require('mini.indentscope').setup()
require('mini.bufremove').setup()
require('mini.trailspace').setup()
require('mini.starter').setup()
-- require('mini.jump').setup()
-- require('mini.completion').setup()
-- require('mini.jump2d').setup({
-- 	view = {
-- 		-- Whether to dim lines with at least one jump spot
-- 		dim = true,
--
-- 		-- How many steps ahead to show. Set to big number to show all steps.
-- 		n_steps_ahead = 3,
-- 	},
--
-- 	-- Which lines are used for computing spots
-- 	allowed_lines = {
-- 		blank = true, -- Blank line (not sent to spotter even if `true`)
-- 		cursor_before = true, -- Lines before cursor line
-- 		cursor_at = true, -- Cursor line
-- 		cursor_after = true, -- Lines after cursor line
-- 		fold = true, -- Start of fold (not sent to spotter even if `true`)
-- 	},
--
-- 	-- Which windows from current tabpage are used for visible lines
-- 	allowed_windows = {
-- 		current = true,
-- 		not_current = true,
-- 	},
--
-- 	-- Functions to be executed at certain events
-- 	hooks = {
-- 		before_start = nil, -- Before jump start
-- 		after_jump = nil, -- After jump was actually done
-- 	},
--
-- 	-- Module mappings. Use `''` (empty string) to disable one.
-- 	mappings = {
-- 		start_jumping = 'f',
-- 	},
-- })
