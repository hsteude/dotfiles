return {
    {
        "iamcco/markdown-preview.nvim",
        ft = "markdown",
        build = ":call mkdp#util#install()",
        init = function()
            vim.g.mkdp_auto_close = 0
        end,
    },
}
