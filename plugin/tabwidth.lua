local tabwidthAutocmds =
    vim.api.nvim_create_augroup('tabwidthAutocmds', { clear = true })

vim.api.nvim_create_autocmd({ 'FileType' }, {
    desc = 'Applies the indentation specified on the prettier file if exists',
    pattern = { 'javascript', 'typescript', 'json' },
    group = tabwidthAutocmds,
    callback = function()
        -- This needs to be updated
        local command = os.getenv('HOME')
            .. '/.local/share/nvim/site/pack/packer/start/tabwidth.nvim/plugin/'
            .. './getPrettierTabWidth.js 2>/dev/null'
        local handle = io.popen(command)
        if handle == nil then
            return
        end

        local tabWidth = tonumber(handle:read('a'))
        handle:close()

        if tabWidth ~= nil and vim.opt.tabstop ~= tabWidth then
            vim.opt_local.tabstop = tabWidth
            vim.opt_local.softtabstop = tabWidth
            vim.opt_local.shiftwidth = tabWidth
        end
    end,
})
