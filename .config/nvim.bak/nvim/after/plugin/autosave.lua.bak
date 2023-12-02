local attach_to_buffer = function (output_bufnr, pattern, command)
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = vim.api.nvim_create_augroup("MyAutocmds", {clear = true}),
        pattern = pattern,
        callback = function()
            local append_data = function (_, data)
                if data then
                    vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, flase, data)
                end
            end

            vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "main.py output:" })
            vim.fn.jobstart(command, {
                on_stdout = append_data,
                on_stderr = append_data,
            })
        end
    })
end

-- attach_to_buffer(4, "*.py", {"python", "main.py"})

vim.api.nvim_create_user_command("AutoRun", function ()
    local bufnr = vim.fn.input("Enter buffer number: ")
    local pattern = vim.fn.input("Enter pattern: ")
    local command = vim.split(vim.fn.input("Enter command: "), " ")
    attach_to_buffer(tonumber(bufnr), pattern, command)
end, {})
