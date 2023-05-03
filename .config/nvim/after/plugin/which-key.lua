local builtin = require("telescope.builtin")
local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        g = {
            name = "LSP Saga",
            r = { "<cmd>Lspsaga rename<CR>", "LSP Saga rename" },
            a = { "<cmd>Lspsaga code_action<CR>", "LSP Saga code_action" },
            f = { "<cmd>Lspsaga lsp_finder<CR>", "LSP Saga lsp_finder" },
            d = { "<cmd>Lspsaga goto_definition<CR>", "LSP Saga goto_definition" },
            p = { "<cmd>Lspsaga peek_definition<CR>", "LSP Saga peek_definition" },
            k = { "<cmd>Lspsaga hover_doc<CR>", "LSP Saga hover_doc" },
        },
        f = {
            name = "Telescope",
            f = { builtin.find_files, "Telescope find files" },
            g = { builtin.live_grep, "Telescope live grep" },
            b = { builtin.buffers, "Telescope find buffers" },
        },
        t = {
            name = "Tab",
            h = { ":-tabm<CR>", "Move tab to left" },
            l = { ":+tabm<CR>", "Move tab to right" },
        },
        x = {
            name = "Trouble",
            x = { "<cmd>TroubleToggle<CR>", "Trouble Toggle", silent = true },
            w = { "<cmd>TroubleToggle workspace_diagnostics<CR>", "Trouble In Workspace", silent = true },
            d = { "<cmd>TroubleToggle document_diagnostics<CR>", "Trouble In Current File", silent = true },
            l = { "<cmd>TroubleToggle loclist<CR>", "Trouble Location List", silent = true },
            q = { "<cmd>TroubleToggle quickfix<CR>", "Trouble Quick Fix", silent = true },
            r = { "<cmd>TroubleToggle lsp_references<CR>", "Trouble References", silent = true },
        },
        h = {
            name = "Gitsigns",
            j = { "Next hunk" },
            k = { "Previous hunk" },
            s = { "Stage hunk" },
            r = { "Reset hunk" },
            u = { "Undo stage hunk" },
            p = { "Preview hunk" },
            S = { "Stage buffer" },
            R = { "Reset buffer" },
            b = { "Blame line" },
            tb = { "Toggle current line blame" },
            d = { "Diff" },
            D = { "Diff HEAD" },
            td = { "Toggle delete" },
        }
    }
})
