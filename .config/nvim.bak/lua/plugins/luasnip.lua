return {
    {
        -- follow latest release.
        --
        "L3MON4D3/LuaSnip",
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
        dependencies = { 'rafamadriz/friendly-snippets' },
        config = function()
            local ls = require("luasnip")
            -- some shorthands...
            -- local snip = ls.snippet
            -- local node = ls.snippet_node
            -- local text = ls.text_node
            -- local insert = ls.insert_node
            -- local func = ls.function_node
            -- local choice = ls.choice_node
            -- local dynamicn = ls.dynamic_node


            require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_lua").load({paths = "./snippets"})

            -- ls.add_snippets(nil, {
            --     all = {
            --         snip({
            --             trig = "aligned",
            --             namr = "LaTeX aligned",
            --             dscr = "The Default Latexblock for aligned in Markdown"
            --         }, {
            --             text({ '$$',
            --                 '\\begin{aligned}',
            --                 '', }), insert(0), text({ "",
            --             '\\end{aligned}',
            --             '$$' }),
            --         }),
            --         snip({
            --                 trig = "meta",
            --                 namr = "Metadata",
            --                 dscr = "Yaml metadata format for markdown"
            --             },
            --             {
            --                 text({ "---",
            --                     "title: '" }), insert(1, "note_title"), text({ "'",
            --                 "author: Niklas von Hirschfeld" }), text({ "",
            --                 "date: " }), func(date, {}), text({ "",
            --                 "tags: [" }), insert(2), text({ "]",
            --                 "enableToc: true",
            --                 "---", "" }),
            --                 insert(0)
            --             }),
            --     },
            -- })
        end
    }
}