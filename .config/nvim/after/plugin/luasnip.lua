local ls = require("luasnip")
-- some shorthands...
local snip = ls.snippet
local node = ls.snippet_node
local text = ls.text_node
local insert = ls.insert_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

local date = function() return { os.date('%Y-%m-%d') } end

ls.add_snippets(nil, {
    all = {
        snip({
            trig = "aligned",
            namr = "LaTeX aligned",
            dscr = "The Default Latexblock for aligned in Markdown"
        }, {
            text({ '$$',
                '\\begin{aligned}',
                '',}), insert(0), text({"",
                '\\end{aligned}',
                '$$' }),
        }),
        snip({
            trig = "meta",
            namr = "Metadata",
            dscr = "Yaml metadata format for markdown"
        },
            {
                text({ "---",
                    "title: " }), insert(1, "note_title"), text({ "",
                "layout: " }), insert(2, "layout"), text({ "",
                "type: " }), insert(3, "layout"), text({ "",
                "author: Niklas von Hirschfeld" }), text({ "",
                "date: " }), func(date, {}), text({ "",
                "categories: [" }), insert(4, ""), text({ "]",
                "lastmod: " }), func(date, {}), text({ "",
                "tags: [" }), insert(5), text({ "]",
                "comments: true",
                "---", "" }),
                insert(0)
            }),
    },
})
