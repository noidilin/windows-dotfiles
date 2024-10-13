-- Because this is a lua file, vim will append it to the runtime,
-- which means you can require(...) it in other lua code (this is useful),
-- but you should also take care not to conflict with other libraries.
--
-- (This is a lua quirk, as it has somewhat poor support for namespacing.)
-- Basically, name your file,
-- "super_theme/lua/lush_theme/super_theme_dark.lua",
-- not,
-- "super_theme/lua/dark.lua".
-- With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--  `:Lushify`

local lush = require("lush")
local hsl = lush.hsl
local p = require("lush_theme.color")

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
	local sym = injected_functions.sym

	return {
		-- An empty definition `{}` will clear all styling, leaving elements looking like 'Normal' group
		-- To be able to link to a group, it must already be defined, so you may have to reorder items as you go

		-- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight groups
		-- See :h highlight-groups
		ColorColumn { bg = p.mono05 }, -- Columns set with 'colorcolumn'
		Conceal { fg = p.mono22, bg = p.mono02 }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor { gui = "reverse" }, -- Character under the cursor
		CurSearch { fg = p.mono16, bg = p.mono10 or p.mono07 }, -- Highlighting a search pattern under the cursor (see 'hlsearch')
		vCursor { gui = "reverse" },
		iCursor { gui = "reverse" },
		lCursor { gui = "reverse" }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
		CursorIM { gui = "reverse" }, -- Like Cursor, but used when in IME mode |CursorIM|
		CursorColumn { bg = p.mono05 }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
		CursorLine { bg = p.mono05 }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
		Directory { fg = p.acc02 }, -- Directory names (and other special names in listings)
		DiffAdd { fg = p.green00 }, -- Diff mode: Added line |diff.txt|
		DiffChange { fg = p.yellow00 }, -- Diff mode: Changed line |diff.txt|
		DiffDelete { fg = p.red00 }, -- Diff mode: Deleted line |diff.txt|
		DiffText { fg = p.mono16 }, -- Diff mode: Changed text within a changed line |diff.txt|
		DiffAdded { fg = p.green00 },
		DiffRemoved { fg = p.red00 },
		DiffFile { fg = p.mono19 },
		DiffIndexLine { fg = p.mono12 },
		EndOfBuffer { fg = p.mono12 }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
		Terminal { fg = p.mono16, bg = p.mono02 },
		-- TermCursor     { }, -- Cursor in a focused terminal
		-- TermCursorNC   { }, -- Cursor in an unfocused terminal
		ErrorMsg { fg = p.red00, gui = "bold" }, -- Error messages on the command line
		-- VertSplit      { }, -- Column separating vertically split windows
		Folded { fg = p.mono12, bg = p.mono02 }, -- Line used for closed folds
		FoldColumn { fg = p.mono12, bg = p.mono02 }, -- 'foldcolumn'
		SignColumn { fg = p.mono16, bg = p.mono02 }, -- Column where |signs| are displayed
		IncSearch { fg = p.mono02, bg = p.mono10 or p.mono07 }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
		Substitute { fg = p.mono25, bg = p.mono07 }, -- |:substitute| replacement text highlighting
		LineNr { fg = p.mono12 }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
		-- LineNrAbove    { }, -- Line number for when the 'relativenumber' option is set, above the cursor line
		-- LineNrBelow    { }, -- Line number for when the 'relativenumber' option is set, below the cursor line
		CursorLineNr { fg = p.mono16 }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
		-- CursorLineFold { }, -- Like FoldColumn when 'cursorline' is set for the cursor line
		-- CursorLineSign { }, -- Like SignColumn when 'cursorline' is set for the cursor line
		MatchParen { fg = p.mono16, bg = p.mono07 }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
		ModeMsg { fg = p.mono22, gui = "bold" }, -- 'showmode' message (e.g., "-- INSERT -- ")
		-- MsgArea        { }, -- Area for messages and cmdline, don't set this highlight because of https://github.com/neovim/neovim/issues/17832
		MsgSeparator { fg = p.mono15, bg = p.mono05, gui = "bold" }, -- Separator for scrolled messages, `msgsep` flag of 'display'
		MoreMsg { fg = p.mono22, gui = "bold" }, -- |more-prompt|
		NonText { fg = p.mono12 }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
		Normal { fg = p.mono16, bg = p.mono02 }, -- Normal text
		NormalFloat { fg = p.mono16, bg = p.mono02 }, -- Normal text in floating windows.
		FloatBorder { fg = p.mono09, bg = p.mono02 }, -- Border of floating windows.
		FloatTitle { fg = p.mono09, bg = p.mono02 }, -- Title of floating windows.
		FloatFooter { fg = p.mono09, bg = p.mono02 },
		-- NormalNC       { }, -- normal text in non-current windows
		Pmenu { fg = p.mono16, bg = p.mono07 }, -- Popup menu: Normal item.
		PmenuSel { bg = p.mono02 }, -- Popup menu: Selected item.
		-- PmenuKind      { }, -- Popup menu: Normal item "kind"
		-- PmenuKindSel   { }, -- Popup menu: Selected item "kind"
		-- PmenuExtra     { }, -- Popup menu: Normal item "extra text"
		-- PmenuExtraSel  { }, -- Popup menu: Selected item "extra text"
		PmenuSbar { bg = p.mono07 }, -- Popup menu: Scrollbar.
		PmenuThumb { bg = p.mono07 }, -- Popup menu: Thumb of the scrollbar.
		Question { fg = p.acc_dim05 }, -- |hit-enter| prompt and yes/no questions
		QuickFixLine { fg = p.mono22, gui = "underline" }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
		Search { fg = p.mono16, bg = p.mono10 or p.mono07 }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
		SpecialKey { fg = p.mono12 }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
		SpellBad { sp = p.red00, gui = "undercurl" }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
		SpellCap { sp = p.orange00, gui = "undercurl" }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
		SpellLocal { sp = p.yellow00, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
		SpellRare { sp = p.yellow00, gui = "undercurl" }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
		StatusLine { fg = p.mono16, bg = p.mono12 }, -- Status line of current window
		StatusLineTerm { fg = p.mono16, bg = p.mono05 },
		StatusLineNC { fg = p.mono12, bg = p.mono02 }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
		StatusLineTermNC { fg = p.mono12, bg = p.mono05 },
		TabLine { fg = p.mono16, bg = p.mono05 }, -- Tab pages line, not active tab page label
		TabLineFill { fg = p.mono12, bg = p.mono05 }, -- Tab pages line, where there are no labels
		TabLineSel { fg = p.mono02, bg = p.mono16 }, -- Tab pages line, active tab page label
		ToolbarButton { fg = p.mono02, bg = p.mono07 },
		ToolbarLine { fg = p.mono16 },
		Title { fg = p.acc_dim02 }, -- Titles for output from ":set all", ":autocmd"
		Visual { fg = p.mono16, bg = p.mono07 }, -- Visual mode selection
		VisualNOS { bg = p.mono12, gui = "underline" }, -- Visual mode selection when vim is "Not Owning the Selection".
		WarningMsg { fg = p.orange00, gui = "bold" }, -- Warning messages
		Whitespace { fg = p.mono09 }, -- "nbsp", "space", "tab" and "trail" in 'listchars'
		Winseparator { fg = p.mono09 }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
		WildMenu { fg = p.mono02, bg = p.mono22 }, -- Current match in 'wildmenu' completion
		-- WinBar         { }, -- Window bar of current window
		-- WinBarNC       { }, -- Window bar of not-current windows

		-- Common vim syntax groups used for all kinds of code and markup.
		-- See :h group-name
		c_comment { fg = p.mono12, gui = "italic" },
		c_keyword { fg = p.mono19, gui = "bold" },
		c_block { fg = p.mono19, gui = "italic" },
		c_operator { fg = p.mono19 },

		c_regexp { fg = p.mono15 },
		c_string { fg = p.mono15, gui = "italic" },
		c_number { fg = p.mono17 },
		c_boolean { fg = p.mono17 },
		c_constant { fg = p.acc_dim05 },

		c_function { fg = p.mono22 },
		c_method { fg = p.mono22, gui = "italic" },
		c_variable { fg = p.mono17 },

		c_namespace { fg = p.mono25, gui = "underline" },
		c_interface { fg = p.mono25 },
		c_type { fg = p.mono25 },
		c_class { fg = p.mono17 },
		c_event { fg = p.acc_dim02, gui = "underline" },
		c_property { fg = p.acc_dim02, gui = "italic" },
		c_parameter { fg = p.mono17, gui = "bold underline" },
		c_error { fg = p.red00, gui = "bold" },

		Comment { c_comment }, -- Any comment

		Constant { c_constant }, -- (*) Any constant
		String { c_string }, --   A string constant: "this is a string"
		Character { c_string }, --   A character constant: 'c', '\n'
		Number { c_number }, --   A number constant: 234, 0xff
		Boolean { c_boolean }, --   A boolean constant: TRUE, false
		Float { c_number }, --   A floating point constant: 2.3e10

		Identifier { c_variable }, -- (*) Any variable name
		Function { c_function }, --   Function name (also: methods for classes)

		Statement { c_block }, -- (*) Any statement
		Conditional { c_block }, --   if, then, else, endif, switch,
		Repeat { c_block }, --   for, do, while,
		Label { c_block }, --   case, default,
		Operator { c_operator }, --   "sizeof", "+", "*",
		Keyword { c_keyword }, --   any other keyword
		Exception { c_block }, --   try, catch, throw

		PreProc { fg = p.acc_dim05 }, -- (*) Generic Preprocessor
		Include { fg = p.mono19 }, --   Preprocessor #include
		Define { fg = p.mono12 }, --   Preprocessor #define
		Macro { fg = p.acc_dim05 }, --   Same as Define
		PreCondit { fg = p.mono12 }, --   Preprocessor #if, #else, #endif,

		Type { fg = p.mono25 }, -- (*) int, long, char,
		StorageClass { fg = p.acc_dim05 }, --   static, register, volatile,
		Structure { fg = p.acc_dim05 }, --   struct, union, enum,
		Typedef { fg = p.acc_dim05 }, --   A typedef

		Special { fg = p.mono20 }, -- (*) Any special symbol
		SpecialChar { fg = p.mono19 }, --   Special character in a constant
		Tag { fg = p.mono20 }, --   You can use CTRL-] on this
		Delimiter { fg = p.mono16 }, --   Character that needs attention
		SpecialComment { fg = p.mono19 }, --   Special things inside a comment (e.g. '\n')
		Debug { fg = p.acc_dim05 }, --   Debugging statements
		DebugPC { fg = p.mono02, bg = p.mono16 },
		DebugBreakpoint { fg = p.mono02, bg = p.mono19 },

		-- Underlined     { gui = "underline" }, -- Text that stands out, HTML links
		-- Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
		Error { c_error }, -- Any erroneous construct
		Todo { fg = p.mono22 }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX

		-- Tree-Sitter syntax groups.
		-- See :h treesitter-highlight-groups
		--
		-- Tree-Sitter groups are defined with an "@" symbol, which must be specially handled to be valid lua code.
		-- We do this via the special sym function. The following are all valid ways to call the sym function,
		-- for more details see https://www.lua.org/pil/5.html
		--
		-- sym("@text.literal")
		-- sym('@text.literal')
		-- sym"@text.literal"
		-- sym'@text.literal'
		--
		-- For more information see https://github.com/rktjmp/lush.nvim/issues/109

		-- semantic
		sym("@lsp.type.interface") { Structure },
		sym("@lsp.type.class") { Structure },
		sym("@lsp.type.comment") { Comment },
		sym("@lsp.type.enum") { Structure },
		-- sym( "@lsp.type.enumMember" )  { }, -- @variable.member
		sym("@lsp.type.typeParameter") { Typedef },
		-- sym( "@lsp.type.namespace" )  { }, -- @module
		-- sym( "@lsp.type.parameter" )  { }, -- @variable.parameter
		-- sym( "@lsp.type.property" )  { }, -- @type
		-- sym( "@lsp.type.variable" )  { }, -- @constant
		sym("@lsp.type.macro") { Macro },
		sym("@lsp.type.number") { c_number },
		sym("@lsp.type.operator") { c_operator },
		sym("@lsp.type.keyword") { c_keyword },
		-- sym( "@lsp.type.escapeSequence" )  {  }, -- @string.escape
		-- sym( "@lsp.type.formatSpecifier" )  {  }, -- @punctuation.special
		-- sym( "@lsp.type.function" )  { }, -- @function.call
		-- sym( "@lsp.type.method" )  { }, -- @function.method
		-- sym( "@lsp.type.generic" )  { }, -- @type
		-- sym( "@lsp.type.builtinType" )  { }, -- @type.builtin
		-- sym( "@lsp.type.typeAlias" )  { link = "@type.definition" }, -- @type.definition
		sym("@lsp.type.selfParameter") { Special },
		-- sym( "@lsp.type.selfKeyword" )  {  }, -- @variable.builtin
		sym("@lsp.type.unresolvedReference") { c_error },
		-- sym( "@lsp.type.builtinConstant" )  { }, -- @constant.builtin

		sym("@lsp.typemod.class.defaultLibrary") {}, -- @type.builtin
		sym("@lsp.typemod.enum.defaultLibrary") {}, -- @type.builtin
		sym("@lsp.typemod.enumMember.defaultLibrary") {}, -- @constant.builtin
		sym("@lsp.typemod.keyword.async") {}, -- @keyword.coroutine
		sym("@lsp.typemod.macro.defaultLibrary") {}, -- @function.builtin
		sym("@lsp.typemod.method.defaultLibrary") {}, -- @function.builtin
		sym("@lsp.typemod.operator.injected") { c_operator },
		sym("@lsp.typemod.string.injected") { c_string },
		sym("@lsp.typemod.type.defaultLibrary") {}, -- @type.builtin

		-- type function modifiers
		-- sym( "@lsp.typemod.function" )  { }, -- @function.call
		-- sym( "@lsp.typemod.function.defaultLibrary" )  { }, -- @function.builtin
		-- sym( "@lsp.typemod.function.builtin" )  { }, -- @function.builtin
		-- sym( "@lsp.typemod.function.definition" )  { }, -- @function

		-- type variable modifiers
		-- sym( "@lsp.typemod.variable.defaultLibrary" )  { }, -- @constant.builtin
		-- sym( "@lsp.typemod.variable.definition" )  { }, -- @property
		sym("@lsp.typemod.variable.injected") { c_variable },

		-- Identifier
		sym("@variable") { c_variable }, -- Identifier: any variable that does not have another highlight
		sym("@variable.builtin") { fg = p.mono20 }, -- variable names that are defined by the language, like 'this' or 'self'
		sym("@field") { fg = p.mono20 },
		sym("@variable.member") { fg = p.mono20 }, -- fields
		sym("@parameter") { c_parameter },
		sym("@variable.parameter") { c_parameter }, -- parameters of a function

		sym("@constant") { c_constant }, -- Constant
		sym("@constant.builtin") { fg = p.mono17 }, -- Special: constants that are defined by the language, like 'nil' in lua
		sym("@constant.macro") { Macro }, -- Define: constants that are defined by macros like 'NULL' in c

		sym("@label") { Label }, -- Label
		sym("@namespace") { Constant },
		sym("@module") { Constant }, -- modules and namespace

		-- literals
		sym("@comment") { c_comment }, -- Comment
		sym("@string") { c_string }, -- String
		sym("@string.documentation") { c_comment }, -- doc strings
		sym("@string.regexp") { SpecialChar }, -- regex
		sym("@string.escape") { SpecialChar }, -- escape characters within string
		sym("@string.special") { SpecialChar },
		sym("@string.special.symbol") { Identifier },
		sym("@string.special.url") { fg = p.mono22 }, -- urls, links, emails

		sym("@character") { c_string }, -- Character
		sym("@character.special") { SpecialChar },

		sym("@boolean") { c_boolean }, -- Boolean
		sym("@number") { c_number }, -- Number: all numbers
		sym("@float") { c_number }, -- Float
		sym("@number.float") { c_number }, -- Float

		-- types
		sym("@type") { Type }, -- Types
		sym("@type.builtin") { fg = p.mono20 }, -- builtin types
		sym("@type.definition") { Typedef }, -- Typedef
		sym("@type.declaration") { fg = p.acc_dim05 },

		sym("@attribute") { Constant }, -- attributes, like <decorators> in python
		sym("@property") { c_property }, --same as TSField

		-- functions
		sym("@function") { c_function }, -- Function
		sym("@function.builtin") { Special }, -- Special
		sym("@macro") { Macro }, -- Macro
		sym("@function.macro") { Macro }, -- Macro
		sym("@function.call") { fg = p.mono17 },
		sym("@method") { fg = p.mono22 },
		sym("@function.method") { fg = p.mono22 },
		sym("@function.method.call") { fg = p.mono25 },

		sym("@constructor") { fg = p.acc_dim05 }, -- constructor calls and definitions
		sym("@constructor.lua") { fg = p.mono25 }, -- constructor calls and definitions, `= { }` in lua

		-- keywords
		-- sym"@define"            { }, -- Define
		-- sym"@storageclass"      { }, -- StorageClass
		-- sym"@structure"         { }, -- Structure
		-- sym"@include"           { }, -- Include
		-- sym"@debug"             { }, -- Debug

		sym("@keyword") { c_keyword }, -- Keyword: keywords that don't fall in previous categories
		sym("@operator") { c_operator }, -- Operator
		sym("@keyword.operator") { c_operator }, -- keyword operator (eg, 'in' in python)
		sym("@keyword.return") { fg = p.mono19 }, -- keywords used to define a function
		sym("@exception") { c_block }, -- Exception
		sym("@keyword.exception") { c_block }, -- Exception
		sym("@conditional") { c_block }, -- Conditional
		sym("@keyword.conditional") { c_block }, -- keywords for conditional statements
		sym("@repeat") { c_block }, -- Repeat
		sym("@preproc") { PreProc }, -- PreProc
		sym("@keyword.import") { PreProc }, -- keywords used to define a function

		-- punctuation
		sym("@punctuation") { Delimiter }, -- Delimiter
		sym("@punctuation.delimiter") { fg = p.mono16 }, -- delimiters, like `; . , `
		sym("@punctuation.bracket") { fg = p.mono16 }, -- brackets and parentheses
		sym("@punctuation.special") { SpecialChar }, -- punctuation that does not fall into above categories, like `{}` in string interpolation

		-- markup
		sym("@markup") { fg = p.mono16 }, -- text in markup language
		sym("@markup.strong") { fg = p.mono16, gui = "bold" }, -- bold
		sym("@markup.italic") { fg = p.mono16, gui = "italic" }, -- italic
		sym("@markup.underline") { fg = p.mono16, gui = "underline" }, -- underline
		sym("@markup.strikethrough") { fg = p.mono12, gui = "strikethrough" }, -- strikethrough
		sym("@markup.heading") { fg = p.mono19 }, -- markdown titles
		sym("@markup.quote.markdown") { fg = p.mono12 }, -- quotes with >
		sym("@markup.link.uri") { fg = p.mono15, gui = "underline" }, -- urls, links, emails
		sym("@markup.link") { fg = p.mono15 }, -- text references, footnotes, citations, etc
		sym("@markup.list") { fg = p.mono22 },
		sym("@markup.list.checked") { fg = p.mono22 }, -- todo checked
		sym("@markup.list.unchecked") { fg = p.mono22 }, -- todo unchecked
		sym("@markup.raw") { fg = p.acc_dim05 }, -- inline code in markdown
		sym("@markup.math") { fg = p.mono15 }, -- math environments, like `$$` in latex

		-- diff
		sym("@diff.plus") { fg = p.green00 }, -- added text (diff files)
		sym("@diff.minus") { fg = p.red00 }, -- removed text (diff files)
		sym("@diff.delta") { fg = p.yellow00 }, -- changed text (diff files)

		-- tags
		sym("@tag") { Tag }, -- Tag
		sym("@tag.attribute") { Identifier }, -- tags, like in html
		sym("@tag.delimiter") { fg = p.mono16 }, -- tag delimiter < >

		-- sym"@text.literal"      { }, -- Comment
		-- sym"@text.reference"    { }, -- Identifier
		-- sym"@text.title"        { }, -- Title
		-- sym"@text.uri"          { }, -- Underlined
		-- sym"@text.underline"    { }, -- Underlined
		-- sym"@text.todo"         { }, -- Todo

		-- These groups are for the native LSP client and diagnostic system.
		-- Some other LSP clients may use these groups, or use their own.
		-- See :h lsp-highlight
		LspReferenceText { bg = p.mono09 }, -- Used for highlighting "text" references
		LspReferenceRead { bg = p.mono09 }, -- Used for highlighting "read" references
		LspReferenceWrite { bg = p.mono09 }, -- Used for highlighting "write" references
		LspCodeLens { fg = p.mono12, gui = "italic" }, -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
		LspCodeLensSeparator { fg = p.mono12 }, -- Used to color the seperator between two or more code lens.
		-- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.
		LspCxxHlGroupEnumConstant { fg = p.mono25 },
		LspCxxHlGroupMemberVariable { fg = p.mono25 },
		LspCxxHlGroupNamespace { fg = p.mono22 },
		LspCxxHlSkippedRegion { fg = p.mono12 },
		LspCxxHlSkippedRegionBeginEnd { fg = p.mono19 },

		-- See :h diagnostic-highlights
		DiagnosticError { fg = p.red00, gui = "bold" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticWarn { fg = p.orange00 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticInfo { fg = p.yellow00, fmt = "italic" }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticHint { fg = p.acc02 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticOk { fg = p.green00 }, -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
		DiagnosticVirtualTextError { fg = p.red00, gui = "bold" }, -- Used for "Error" diagnostic virtual text.
		DiagnosticVirtualTextWarn { fg = p.orange00 }, -- Used for "Warn" diagnostic virtual text.
		DiagnosticVirtualTextInfo { fg = p.acc02 }, -- Used for "Info" diagnostic virtual text.
		DiagnosticVirtualTextHint { fg = p.acc02 }, -- Used for "Hint" diagnostic virtual text.
		DiagnosticVirtualTextOk { fg = p.green00 }, -- Used for "Ok" diagnostic virtual text.
		-- TODO: what is sp
		DiagnosticUnderlineError { gui = "undercurl", sp = p.red00 }, -- Used to underline "Error" diagnostics.
		DiagnosticUnderlineWarn { gui = "undercurl", sp = p.yellow00 }, -- Used to underline "Warn" diagnostics.
		DiagnosticUnderlineInfo { gui = "undercurl", sp = p.acc02 }, -- Used to underline "Info" diagnostics.
		DiagnosticUnderlineHint { gui = "undercurl", sp = p.acc02 }, -- Used to underline "Hint" diagnostics.
		DiagnosticUnderlineOk { gui = "undercurl", sp = p.green00 }, -- Used to underline "Ok" diagnostics.
		-- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
		-- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
		-- DiagnosticFloatingOk       { } , -- Used to color "Ok" diagnostic messages in diagnostics float.
		-- DiagnosticSignError        { } , -- Used for "Error" signs in sign column.
		-- DiagnosticSignWarn         { } , -- Used for "Warn" signs in sign column.
		-- DiagnosticSignInfo         { } , -- Used for "Info" signs in sign column.
		-- DiagnosticSignHint         { } , -- Used for "Hint" signs in sign column.
		-- DiagnosticSignOk           { } , -- Used for "Ok" signs in sign column.

		TroubleText { fg = p.mono19 },
		TroubleCount { fg = p.red00, bg = p.mono05 },
		TroubleNormal { fg = p.mono17, bg = p.mono01 },

		-- bufferline
		BufferLineFill { fg = p.mono02, bg = p.mono02 },
		BufferLineTruncMarker { fg = p.mono09, bg = p.mono02 },

		-- hint
		BufferLinePick { fg = p.mono01, bg = p.mono17 },
		BufferLinePickSelected { BufferLinePick },
		BufferLinePickVisible { BufferLinePick },

		-- seperat #242424
		BufferLineSeparator { fg = p.mono05, bg = p.mono02 },
		BufferLineOffsetSeparator { BufferLineSeparator },
		BufferLineTabSeparator { BufferLineSeparator },
		BufferLineTabSeparatorSelected { BufferLineSeparator },
		BufferLineSeparatorVisible { BufferLineSeparator },
		BufferLineSeparatorSelected { BufferLineSeparator },
		BufferLineGroupSeparator { BufferLineSeparator },
		BufferLineGroupLabel { fg = p.mono15, bg = p.mono03 },

		-- tabs
		BufferLineTab { fg = p.mono15, bg = p.mono02 },
		BufferLineTabClose { BufferLineTab },
		BufferLineTabSelected { BufferLinePick },

		-- selected
		BufferLineBufferSelected { fg = p.mono19, bg = p.mono02, gui = "bold" },
		BufferLineIndicatorSelected { fg = p.mono17, bg = p.mono02 },
		BufferLineCloseButtonSelected { BufferLineIndicatorSelected },
		BufferLineDevIconDefaultSelected { BufferLineIndicatorSelected },
		BufferLineMiniIconsAzureSelected { BufferLineIndicatorSelected },
		BufferLineNumbersSelected { BufferLineBufferSelected },
		BufferLineModifiedSelected { fg = p.acc_dim02, bg = p.mono02, gui = "bold italic" },
		BufferLineErrorSelected { fg = p.red01, bg = p.mono02, gui = "bold italic" },
		BufferLineErrorDiagnosticSelected { fg = p.red00, bg = p.mono02, gui = "bold italic" },
		BufferLineHintSelected { fg = p.acc_dim05, bg = p.mono02, gui = "bold italic" },
		BufferLineHintDiagnosticSelected { fg = p.acc_dim02, bg = p.mono02, gui = "bold italic" },
		BufferLineInfoSelected { fg = p.mono21, bg = p.mono02, gui = "bold italic" },
		BufferLineInfoDiagnosticSelected { fg = p.mono17, bg = p.mono02, gui = "bold italic" },
		BufferLineWarningSelected { fg = p.orange01, bg = p.mono02, gui = "bold italic" },
		BufferLineWarningDiagnosticSelected { fg = p.orange00, bg = p.mono02, gui = "bold italic" },
		BufferLineDiagnosticSelected { fg = p.mono13, bg = p.mono02, gui = "bold italic" },

		-- visable
		BufferLineBufferVisible { fg = p.mono15, bg = p.mono02, gui = "italic" },
		BufferLineIndicatorVisible { fg = p.mono11, bg = p.mono02 },
		BufferLineCloseButtonVisible { BufferLineIndicatorVisible },
		BufferLineDevIconDefaultInactive { BufferLineIndicatorVisible },
		BufferLineMiniIconsAzureInactive { BufferLineIndicatorVisible },
		BufferLineNumbersVisible { BufferLineBufferVisible },
		BufferLineModifiedVisible { fg = p.acc_dim02, bg = p.mono02 },
		BufferLineErrorVisible { fg = p.red00, bg = p.mono02 },
		BufferLineErrorDiagnosticVisible { BufferLineErrorVisible },
		BufferLineHintVisible { fg = p.acc_dim02, bg = p.mono02 },
		BufferLineHintDiagnosticVisible { BufferLineHintVisible },
		BufferLineInfoVisible { fg = p.mono17, bg = p.mono02 },
		BufferLineInfoDiagnosticVisible { BufferLineInfoVisible },
		BufferLineWarningVisible { fg = p.orange00, bg = p.mono02 },
		BufferLineWarningDiagnosticVisible { BufferLineWarningVisible },
		BufferLineDiagnosticVisible { fg = p.mono11, bg = p.mono02 },

		-- buffer (open but not visible)
		BufferLineBuffer { fg = p.mono11, bg = p.mono02 },
		BufferLineBackground { fg = p.mono11, bg = p.mono02 },
		BufferLineCloseButton { fg = p.mono09, bg = p.mono02 },
		BufferLineDevIconDefault { BufferLineCloseButton },
		BufferLineMiniIconsAzure { BufferLineCloseButton },
		BufferLineNumbers { BufferLineCloseButton },
		BufferLineModified { BufferLineModifiedVisible },
		BufferLineError { BufferLineErrorVisible },
		BufferLineErrorDiagnostic { BufferLineErrorDiagnosticVisible },
		BufferLineHint { BufferLineHintVisible },
		BufferLineHintDiagnostic { BufferLineHintDiagnosticVisible },
		BufferLineInfo { BufferLineInfoVisible },
		BufferLineInfoDiagnostic { BufferLineInfoDiagnosticVisible },
		BufferLineWarning { BufferLineWarningVisible },
		BufferLineWarningDiagnostic { BufferLineWarningDiagnosticVisible },
		BufferLineDiagnostic { BufferLineDiagnosticVisible },

		-- cmp
		CmpItemAbbr { fg = p.mono16 },
		CmpItemAbbrDeprecated { fg = p.mono12, gui = "strikethrough" },
		CmpItemAbbrMatch { fg = p.mono19 },
		CmpItemAbbrMatchFuzzy { fg = p.mono19 },

		CmpItemMenu { fg = p.mono12 },
		CmpItemKind { fg = p.mono12 },
		-- function, method, module, struct, event
		CmpItemKindFunction { fg = p.mono22 },
		CmpItemKindMethod { fg = p.mono22 },
		CmpItemKindModule { fg = p.mono22 },
		CmpItemKindStruct { fg = p.mono22 },
		CmpItemKindEvent { fg = p.mono22 },
		-- constructor, class, interface
		CmpItemKindConstructor { fg = p.mono25 },
		CmpItemKindClass { fg = p.mono25 },
		CmpItemKindInterface { fg = p.mono25 },
		-- keyword, color, reference, enumMember, Operator
		CmpItemKindKeyword { fg = p.mono19 },
		CmpItemKindColor { fg = p.mono19 },
		CmpItemKindReference { fg = p.mono19 },
		CmpItemKindEnumMember { fg = p.mono19 },
		CmpItemKindOperator { fg = p.mono19 },
		-- constant, value, folder, file
		CmpItemKindConstant { fg = p.acc_dim05 },
		CmpItemKindValue { fg = p.acc_dim05 },
		CmpItemKindFolder { fg = p.acc_dim05 },
		CmpItemKindFile { fg = p.acc_dim05 },
		-- text, copilot, snippet
		CmpItemKindText { fg = p.mono15 },
		CmpItemKindCopilot { fg = p.mono15 },
		CmpItemKindSnippet { fg = p.mono15 },
		-- variable, type,
		CmpItemKindVariable { fg = p.mono17 },
		CmpItemKindType { fg = p.mono17 },
		-- field, property, enum, unit
		CmpItemKindField { fg = p.acc_dim02 },
		CmpItemKindProperty { fg = p.acc_dim02 },
		CmpItemKindEnum { fg = p.acc_dim02 },
		CmpItemKindUnit { fg = p.acc_dim02 },

		-- gitsigns
		GitSignsAdd { fg = p.green00 },
		GitSignsAddLn { fg = p.green00 },
		GitSignsAddNr { fg = p.green00 },
		GitSignsChange { fg = p.yellow00 },
		GitSignsChangeLn { fg = p.yellow00 },
		GitSignsChangeNr { fg = p.yellow00 },
		GitSignsDelete { fg = p.red00 },
		GitSignsDeleteLn { fg = p.red00 },
		GitSignsDeleteNr { fg = p.red00 },

		-- neo tree
		NeoTreeNormal { fg = p.mono16, bg = p.mono02 },
		NeoTreeNormalNC { fg = p.mono16, bg = p.mono02 },
		NeoTreeVertSplit { fg = p.mono12, bg = p.mono02 },
		NeoTreeWinSeparator { fg = p.mono12, bg = p.mono02 },
		NeoTreeEndOfBuffer { fg = p.mono12, bg = p.mono02 },
		NeoTreeRootName { fg = p.acc02, fmt = "bold" }, -- TODO: what is fmt
		NeoTreeGitAdded { fg = p.green00 },
		NeoTreeGitDeleted { fg = p.red00 },
		NeoTreeGitModified { fg = p.yellow00 },
		NeoTreeGitConflict { fg = p.red00, fmt = "bold,italic" }, -- TODO: what is fmt
		NeoTreeGitUntracked { fg = p.red00, fmt = "italic" }, -- TODO: what is fmt
		NeoTreeIndentMarker { fg = p.mono12 },
		NeoTreeSymbolicLinkTarget { fg = p.acc02 },

		-- telescope
		TelescopeBorder { fg = p.mono09 },
		TelescopeMatching { fg = p.mono21, bg = p.mono05, gui = "bold" },
		TelescopePromptPrefix { fg = p.acc_dim05 },
		TelescopeSelection { fg = p.acc_dim05, bg = p.mono05 },
		TelescopeSelectionCaret { fg = p.mono25 },
		TelescopeResultsNormal { fg = p.mono16 },

		-- dashboard
		DashboardShortCut { fg = p.acc_dim05 },
		DashboardHeader { fg = p.mono19 },
		DashboardCenter { fg = p.mono16 },
		DashboardFooter { fg = p.mono17, gui = "italic" },

		-- neo test
		NeotestTest { fg = p.mono16 },
		NeotestUnknown { fg = p.mono16 },
		NeotestDir { fg = p.mono12 },
		NeotestFile { fg = p.acc_dim05 },
		NeotestPassed { fg = p.green00 },
		NeotestFailed { fg = p.red00 },
		NeotestMarked { fg = p.yellow00 },
		NeotestWatching { fg = p.orange00 },
		NeotestTarget { fg = p.mono22 },
		NeotestFocused { fg = p.acc02, gui = "bold" },
		NeotestRunning { fg = p.acc02 },
		NeotestAdapterName { fg = p.mono22, gui = "bold" },
		NeotestNamespace { fg = p.mono17 },
		NeotestSkipped { fg = p.orange00 },
		NeotestIndent { fg = p.mono12 },

		-- avante color
		-- avante UI
		AvanteTitle { fg = p.acc_dim05, bg = p.mono10 }, -- title
		AvanteReversedTitle { fg = p.mono10 }, -- used for rounded border
		AvanteSubtitle { fg = p.acc_dim05, bg = p.mono10 }, -- selected code title
		AvanteReversedSubtitle { fg = p.mono10 }, -- used for rounded border
		AvanteThirdTitle { fg = p.mono21, bg = p.mono10 }, -- prompt title
		AvanteReversedThirdTitle { fg = p.mono10 }, -- used for rounded border
		-- avante conflict
		AvanteConflictCurrent { fg = p.mono24, bg = p.cyan00, gui = "bold" },
		AvanteConflictIncoming { fg = p.mono24, bg = p.orange00, gui = "bold" },
		AvanteConflictAncestor { fg = p.mono24, bg = p.mono15, gui = "bold" },
		-- AvanteConflictCurrentLabel  {}, -- current shade = 60
		-- AvanteConflictIncomingLabel  {}, -- incoming shade = 60
		-- AvanteConflictAncestorLabel  {}, -- ancestor shade = 60
	}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
