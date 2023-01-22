local Job = require('plenary.job')

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
            .. './getPrettierTabWidth.js'
        Job
            :new({
                command = command,
                on_exit = function(j)
                    local tabWidth = tonumber(j:result()[1])
                    vim.defer_fn(function()
                        if tabWidth ~= nil and vim.opt.tabstop ~= tabWidth then
                            vim.opt_local.tabstop = tabWidth
                            vim.opt_local.softtabstop = tabWidth
                            vim.opt_local.shiftwidth = tabWidth
                        end
                    end, 0)
                end,
            })
            :start()
    end,
})
