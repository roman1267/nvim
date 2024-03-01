-------------------- Markdown Link Fixer --------------------
local mkgroup = vim.api.nvim_create_augroup("mkdn_link_fix", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    callback = function()
        -- Original Javascript regex
        -- (?<=(?<!\\)\[.*(?<!\\)\]\(.*)\s+\b(?!.*\\\))
        -- Part 1 vim regex
        -- \(\(\\\)\@<!\[.*\(\\\)\@<!\](.*\)\@<=\s\+
        -- part 2 vim regex (some overlap)
        -- \s\+\(.*\\)\)\@!/%20/g
        vim.cmd("silent! %s/\\(\\(\\\\\\)\\@<!\\[.*\\(\\\\\\)\\@<!\\](.*\\)\\@<=\\s\\+\\(.*\\\\)\\)\\@!/%20/g")
    end,
    group = mkgroup,
    pattern = "*.md",
})
