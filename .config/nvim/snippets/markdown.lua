local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local events = require("luasnip.util.events")


local date = function() return { os.date('%Y-%m-%d') } end

return {
	s({
		trig = "aligned",
		namr = "LaTeX aligned",
		dscr = "The Default Latexblock for aligned in Markdown"
	}, {
		t({ '$$',
			'\\begin{aligned}',
			'', }), i(0), t({ "",
		'\\end{aligned}',
		'$$' }),
	}),
	s({
			trig = "meta",
			namr = "Metadata",
			dscr = "Yaml metadata format for markdown"
		},
		{
			t({ "---",
				"title: '" }), i(1, "note_title"), t({ "'",
			"author: Niklas von Hirschfeld" }), t({ "",
			"date: " }), f(date, {}), t({ "",
			"tags: [" }), i(2), t({ "]",
			"enableToc: true",
			"---", "" }),
			i(0)
	}),
}
