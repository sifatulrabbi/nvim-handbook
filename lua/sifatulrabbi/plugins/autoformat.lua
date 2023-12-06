return {
    'neovim/nvim-lspconfig',
    config = function()
        -- Switch for controlling whether you want autoformatting.
        --  Use :KickstartFormatToggle to toggle autoformatting on or off
        local format_is_enabled = true
        vim.api.nvim_create_user_command('KickstartFormatToggle', function()
            format_is_enabled = not format_is_enabled
            print('Setting autoformatting to: ' .. tostring(format_is_enabled))
        end, {})

        -- Create an augroup that is used for managing our formatting autocmds.
        --      We need one augroup per client to make sure that multiple clients
        --      can attach to the same buffer without interfering with each other.
        local _augroups = {}
        local get_augroup = function(client)
            if not _augroups[client.id] then
                local group_name = 'kickstart-lsp-format-' .. client.name
                local id = vim.api.nvim_create_augroup(group_name, { clear = true })
                _augroups[client.id] = id
            end

            return _augroups[client.id]
        end

        local function should_user_prettier()
            local filetypes = {
                "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "less", "json", "yaml",
                "markdown", "html", "vue",
            }
            local filetype = vim.bo.filetype
            return vim.tbl_contains(filetypes, filetype)
        end

        local function format_using_prettier()
            local filepath = vim.fn.expand('%')
            vim.fn.system('prettier --write ' .. vim.fn.shellescape(filepath))
            if vim.v.shell_error ~= 0 then
                print("Prettier failed to format the file.")
            else
                -- You may want to reload the buffer if changes were made
                vim.cmd('edit!')
            end
        end

        -- See `:help LspAttach` for more information about this autocmd event.
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach-format', { clear = true }),
            -- This is where we attach the autoformatting for reasonable clients
            callback = function(args)
                local client_id = args.data.client_id
                local client = vim.lsp.get_client_by_id(client_id)
                local bufnr = args.buf

                -- Only attach to clients that support document formatting
                if not client.server_capabilities.documentFormattingProvider then
                    return
                end

                -- Create an autocmd that will run *before* we save the buffer.
                --  Run the formatting command for the LSP that has just attached.
                vim.api.nvim_create_autocmd('BufWritePre', {
                    group = get_augroup(client),
                    buffer = bufnr,
                    callback = function()
                        if not format_is_enabled then
                            return
                        end

                        if should_user_prettier() then
                            format_using_prettier()
                        else
                            vim.lsp.buf.format {
                                async = false,
                                filter = function(c)
                                    return c.id == client.id
                                end,
                            }
                        end
                    end,
                })
            end
            ,
        })
    end,
}
