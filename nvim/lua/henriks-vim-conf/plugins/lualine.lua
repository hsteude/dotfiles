return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto",
                globalstatus = true,
            },
            sections = {
                lualine_a = {  },
                lualine_b = { "mode", "branch", "diff", "diagnostics" },
                lualine_c = {  },
                lualine_x = { "encoding", "fileformat", "filetype" },
                lualine_y = { "progress", "location" },
                lualine_z = {  },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            -- sections = {
            --     lualine_a = {},
            --     lualine_b = { "branch", "diff", "diagnostics" },
            --     -- lualine_c = { "filename" },
            --     lualine_x = { "encoding", "fileformat", "filetype" },
            --     lualine_y = {},
            --     lualine_z = {},
            -- },
        })
    end,
}
