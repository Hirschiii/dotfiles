return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false;
        config = function()
            function ColorMyPencils(color)
                -- color = color or "tokynight"
                -- color = color or "rose-pine"
                color = color or "kanagawa"
                -- color = color or "catppuccin-macchiato"
                -- color = color or "murphy"
                -- color = color or "habamax"
                vim.cmd.colorscheme(color)

                vim.g.limelight_conceal_ctermfg = 240

                -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

                local hl = function(thing, opts)
                    vim.api.nvim_set_hl(0, thing, opts)
                end


                hl("SignColumn", {
                    bg = "none",
                })

                hl("ColorColumn", {
                    ctermbg = 0,
                    bg = "#2B79A0",
                })

                hl("CursorLineNR", {
                    bg = "None"
                })

                hl("Normal", {
                    bg = "none"
                })

                hl("LineNr", {
                    fg = "#5eacd3"
                })

                hl("netrwDir", {
                    fg = "#5eacd3"
                })
            end

            ColorMyPencils()
        end
    }
}
