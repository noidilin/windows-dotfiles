return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	-- event = {
	--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
	--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
	--   "BufReadPre path/to/my-vault/**.md",
	--   "BufNewFile path/to/my-vault/**.md",
	-- },
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required.
	},
	opts = {
		workspaces = {
			{
				name = "obsidian-remote",
				path = "D:\\area\\obsidian-remote",
				-- Optional, override certain settings.
				overrides = {
					notes_subdir = "notes",
				},
			},
		},

		-- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
		-- 'workspaces'. For example:
		-- dir = "~/vaults/work",

		-- Optional, if you keep notes in a specific subdirectory of your vault.
		notes_subdir = "source",

		-- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
		-- levels defined by "vim.log.levels.*".
		-- log_level = vim.log.levels.INFO,

		daily_notes = {
			folder = "calendar/daily", -- Optional, if you keep daily notes in a separate directory.
			date_format = "%Y-%m-%d", -- Optional, if you want to change the date format for the ID of daily notes.
			-- alias_format = "%B %-d, %Y", -- Optional, if you want to change the date format of the default alias of daily notes.
			-- default_tags = { "daily-notes" }, -- Optional, default tags to add to each new daily note created.

			-- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
			template = "extra/templates/periodic/pDaily.md",
		},

		-- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
		completion = {
			nvim_cmp = true, -- Set to false to disable completion.
			min_chars = 2, -- Trigger completion at 2 chars.
		},

		-- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
		-- way then set 'mappings = {}'.
		mappings = {
			-- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
			["gf"] = {
				action = function()
					return require("obsidian").util.gf_passthrough()
				end,
				opts = { noremap = false, expr = true, buffer = true },
			},
			-- Toggle check-boxes.
			["<leader>ch"] = {
				action = function()
					return require("obsidian").util.toggle_checkbox()
				end,
				opts = { buffer = true },
			},
			-- Smart action depending on context, either follow link or toggle checkbox.
			["<cr>"] = {
				action = function()
					return require("obsidian").util.smart_action()
				end,
				opts = { buffer = true, expr = true },
			},
		},

		-- Where to put new notes. Valid options are
		--  * "current_dir" - put new notes in same directory as the current buffer.
		--  * "notes_subdir" - put new notes in the default notes subdirectory.
		new_notes_location = "notes_subdir",

		-- Optional, customize how note IDs are generated given an optional title.
		---@param title string|?
		---@return string
		--[[ note_id_func = function(title)
			-- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
			-- In this case a note with the title 'My new note' will be given an ID that looks
			-- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
			local suffix = ""
			if title ~= nil then
				-- If title is given, transform it into valid file name.
				suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
			else
				-- If title is nil, just add 4 random uppercase letters to the suffix.
				for _ = 1, 4 do
					suffix = suffix .. string.char(math.random(65, 90))
				end
			end
			return tostring(os.time()) .. "-" .. suffix
		end, ]]

		-- Optional, customize how note file names are generated given the ID, target directory, and title.
		---@param spec { id: string, dir: obsidian.Path, title: string|? }
		---@return string|obsidian.Path The full path to the new note.
		--[[ note_path_func = function(spec)
			-- This is equivalent to the default behavior.
			local path = spec.dir / tostring(spec.id)
			return path:with_suffix(".md")
		end, ]]

		-- Optional, customize how wiki links are formatted. You can set this to one of:
		--  * "use_alias_only", e.g. '[[Foo Bar]]'
		--  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
		--  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
		--  * "use_path_only", e.g. '[[foo-bar.md]]'
		-- Or you can set it to a function that takes a table of options and returns a string, like this:
		--[[ wiki_link_func = function(opts)
			return require("obsidian.util").wiki_link_id_prefix(opts)
		end, ]]

		-- Optional, customize how markdown links are formatted.
		--[[ markdown_link_func = function(opts)
			return require("obsidian.util").markdown_link(opts)
		end, ]]

		-- Either 'wiki' or 'markdown'.
		preferred_link_style = "wiki",

		-- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
		---@return string
		image_name_func = function()
			-- Prefix image names with timestamp.
			return string.format("R_%Y%m%d%H%M%S", os.time())
		end,

		-- Optional, boolean or a function that takes a filename and returns a boolean.
		-- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
		-- disable_frontmatter = false,

		-- Optional, alternatively you can customize the frontmatter data.
		---@return table
		--[[ note_frontmatter_func = function(note)
			-- Add the title of the note as an alias.
			if note.title then
				note:add_alias(note.title)
			end

			local out = { id = note.id, aliases = note.aliases, tags = note.tags }

			-- `note.metadata` contains any manually added fields in the frontmatter.
			-- So here we just make sure those fields are kept in the frontmatter.
			if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
				for k, v in pairs(note.metadata) do
					out[k] = v
				end
			end

			return out
		end, ]]

		-- Optional, for templates (see below).
		templates = {
			folder = "extra/templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
			-- A map for custom variables, the key should be the variable and the value a function
			substitutions = {},
		},

		-- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
		-- URL it will be ignored but you can customize this behavior here.
		---@param url string
		--[[ follow_url_func = function(url)
			-- Open the URL in the default web browser.
			vim.fn.jobstart({ "open", url }) -- Mac OS
			-- vim.fn.jobstart({"xdg-open", url})  -- linux
			-- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
		end, ]]

		-- Optional, set to true if you use the Obsidian Advanced URI plugin.
		-- https://github.com/Vinzent03/obsidian-advanced-uri
		use_advanced_uri = false,

		-- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
		open_app_foreground = false,

		picker = {
			-- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
			name = "telescope.nvim",
			-- Optional, configure key mappings for the picker. These are the defaults.
			-- Not all pickers support all mappings.
			note_mappings = {
				new = "<C-x>", -- Create a new note from your query.
				insert_link = "<C-l>", -- Insert a link to the selected note.
			},
			tag_mappings = {
				tag_note = "<C-x>", -- Add tag(s) to current note.
				insert_tag = "<C-l>", -- Insert a tag at the current location.
			},
		},

		-- Optional, sort search results by "path", "modified", "accessed", or "created".
		-- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
		-- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
		sort_by = "modified",
		sort_reversed = true,

		-- Set the maximum number of lines to read from notes on disk when performing certain searches.
		search_max_lines = 1000,

		-- Optional, determines how certain commands open notes. The valid options are:
		-- 1. "current" (the default) - to always open in the current window
		-- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
		-- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
		open_notes_in = "current",

		-- Optional, define your own callbacks to further customize behavior.
		--[[ callbacks = {
			-- Runs at the end of `require("obsidian").setup()`.
			---@param client obsidian.Client
			post_setup = function(client) end,

			-- Runs anytime you enter the buffer for a note.
			---@param client obsidian.Client
			---@param note obsidian.Note
			enter_note = function(client, note) end,

			-- Runs anytime you leave the buffer for a note.
			---@param client obsidian.Client
			---@param note obsidian.Note
			leave_note = function(client, note) end,

			-- Runs right before writing the buffer for a note.
			---@param client obsidian.Client
			---@param note obsidian.Note
			pre_write_note = function(client, note) end,

			-- Runs anytime the workspace is set/changed.
			---@param client obsidian.Client
			---@param workspace obsidian.Workspace
			post_set_workspace = function(client, workspace) end,
		}, ]]

		-- Optional, configure additional syntax highlighting / extmarks.
		-- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.
		ui = {
			enable = true, -- set to false to disable all additional syntax features
			update_debounce = 200, -- update delay after a text change (in milliseconds)
			max_file_length = 5000, -- disable UI features for files with more than this many lines
			-- Define how various check-boxes are displayed
			checkboxes = {
				-- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
				[" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
				["x"] = { char = "", hl_group = "ObsidianDone" },
				[">"] = { char = "", hl_group = "ObsidianRightArrow" },
				["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
				["!"] = { char = "", hl_group = "ObsidianImportant" },
				-- Replace the above with this if you don't have a patched font:
				-- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
				-- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

				-- You can also add more custom ones...
			},
			-- Use bullet marks for non-checkbox lists.
			bullets = { char = "•", hl_group = "ObsidianBullet" },
			external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			-- Replace the above with this if you don't have a patched font:
			-- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
			reference_text = { hl_group = "ObsidianRefText" },
			highlight_text = { hl_group = "ObsidianHighlightText" },
			tags = { hl_group = "ObsidianTag" },
			block_ids = { hl_group = "ObsidianBlockID" },
			hl_groups = {
				-- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
				ObsidianTodo = { bold = true, fg = "#c0baad" },
				ObsidianDone = { bold = true, fg = "#707070" },
				ObsidianRightArrow = { bold = true, fg = "#c0baad" },
				ObsidianTilde = { bold = true, fg = "#de7878" },
				ObsidianImportant = { bold = true, fg = "#af5f5f" },
				ObsidianBullet = { bold = true, fg = "#707070" },
				ObsidianRefText = { underline = true, fg = "#9d9d9d" },
				ObsidianExtLinkIcon = { fg = "#b3ad9f" },
				ObsidianTag = { italic = true, fg = "#dad5c8", bg = "#706c62" },
				ObsidianBlockID = { italic = true, fg = "#dad5c8" },
				ObsidianHighlightText = { bg = "#414141" },
			},
		},
	},
}