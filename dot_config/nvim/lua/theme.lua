local M = {}

M.colors = {
    bg = "#2e3440",
    fg = "#ECEFF4",
    red = "#bf616a",
    orange = "#d08770",
    yellow = "#ebcb8b",
    blue = "#5e81ac",
    green = "#a3be8c",
    cyan = "#88c0d0",
    magenta = "#b48ead",
    purple = "#534671",
    pink = "#FFA19F",
    grey1 = "#f8fafc",
    grey2 = "#f0f1f4",
    grey3 = "#eaecf0",
    grey4 = "#d9dce3",
    grey5 = "#c4c9d4",
    grey6 = "#b5bcc9",
    grey7 = "#929cb0",
    grey8 = "#8e99ae",
    grey9 = "#74819a",
    grey10 = "#616d85",
    grey11 = "#464f62",
    grey12 = "#3a4150",
    grey13 = "#333a47",
    grey14 = "#242932",
    grey15 = "#1e222a",
    grey16 = "#1c1f26",
    grey17 = "#0f1115",
    grey18 = "#0d0e11",
    grey19 = "#020203"
}

local function loadNoClownFiesta()
    vim.cmd [[colorscheme no-clown-fiesta]]
    require("no-clown-fiesta").setup({
        transparent = false, -- Enable this to disable the bg color
        styles = {
            -- You can set any of the style values specified for `:h nvim_set_hl`
            comments = {},
            keywords = {},
            functions = {},
            variables = {},
            type = { bold = true },
        },
    })
end

local themes = {
    onenord = {
        "rmehri01/onenord.nvim",
        config = function()
            require('onenord').setup {
                borders = true,
                fade_nc = false,
                styles = {
                    comments = "italic",
                    strings = "NONE",
                    keywords = "NONE",
                    functions = "italic",
                    variables = "bold",
                    diagnostics = "underline"
                },
                disable = {
                    background = false,
                    cursorline = false,
                    eob_lines = true
                },
                colors = {},
            }
        end
    },
    tokyonight = {
        "folke/tokyonight.nvim",
        config = function()
            local theme = require('tokyonight')
            theme.setup({
                style = 'night',
                on_colors = function(colors)
                    colors.bg_dark = '#000000'
                    colors.bg = '#11121D'
                    -- colors.bg_visual = M.colors.grey12
                end
            })
            theme.load()
        end
    },
    onedark = {
        "navarasu/onedark.nvim",
        config = function()
            local theme = require('onedark')
            theme.setup {
                style = 'deep',
                transparent = false, -- Show/hide background
                code_style = {
                    comments = 'italic',
                    keywords = 'none',
                    functions = 'none',
                    strings = 'none',
                    variables = 'none'
                },
                lualine = {
                    transparent = true, -- lualine center bar transparency
                },
            }
            theme.load()
            -- loadNoClownFiesta()
        end
    },
    palenightfall = {
        "JoosepAlviste/palenightfall.nvim",
        config = function()
            require('palenightfall').setup {}
        end
    },
    rosepine = {
            "rose-pine/neovim", 
        config = function()
            require("rose-pine").setup({
                variant = "auto", -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = false,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true, -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                palette = {
                    -- Override the builtin palette per variant
                    -- moon = {
                    --     base = '#18191a',
                    --     overlay = '#363738',
                    -- },
                },

                highlight_groups = {
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })

            -- vim.cmd("colorscheme rose-pine")
            -- vim.cmd("colorscheme rose-pine-main")
            vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
        end,
    },
    nordic = {
        "AlexvZyl/nordic.nvim",
        config = function()
            require('nordic').setup {}
        end
    },
    onedarkpro = {
        "olimorris/onedarkpro.nvim",
        config = function()
            vim.o.background = "dark"
            require('onedarkpro').load()
        end
    },
    tokyodark = {
        "tiagovla/tokyodark.nvim",
        config = function()
            vim.g.tokyodark_transparent_background = false
            vim.g.tokyodark_enable_italic_comment = true
            vim.g.tokyodark_enable_italic = true
            vim.g.tokyodark_color_gamma = "0.0"
            vim.cmd 'colorscheme tokyodark'
        end
    },
    moonfly = {
        "bluz71/vim-moonfly-colors",
        config = function()
            vim.cmd [[colorscheme moonfly]]
        end
    },
    dracula = {
        "Mofiqul/dracula.nvim",
        config = function()
            local theme = require('dracula')
            theme.setup {}
            theme.load()
        end
    },
    draculanight = {
        "magidc/draculanight",
        config = function()
            local theme = require('draculanight')
            theme.setup {}
            theme.load()
        end
    },
    catppuccin = {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
            vim.cmd [[colorscheme catppuccin]]
        end
    },
    material = {
        "marko-cerovac/material.nvim",
        config = function()
            require "plugins.configs.materialui"
        end
    },
}

M.set_active_theme = function(theme_name)
    M.theme_name = theme_name
end

M.get_active_theme =  function()
    theme = themes[M.theme_name]
    theme.lazy = false 
    theme.priority = 1000
    return theme
end

return M
