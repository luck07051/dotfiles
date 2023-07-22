local M = {}

function M.terminal_send(cmd)
    local terminal_ids = {}

    for _, chan in pairs(vim.api.nvim_list_chans()) do
        if chan["mode"] == "terminal" and chan["pty"] ~= "" then
            table.insert(terminal_ids, chan["id"])
        end
    end

    -- table.sort(terminal_chans, function(left, right)
    --     return left["buffer"] < right["buffer"]
    -- end)

    local size = 0
    for _ in pairs(terminal_ids) do size = size + 1 end

    if size == 0 then
        return
    elseif size == 1 then
        vim.api.nvim_chan_send(terminal_ids[1], cmd)
    else

        local ok, fzf_lua = pcall(require, 'fzf-lua')
        if ok then
            local opts = {}
            opts.prompt = "Terminal> "
            opts.fn_transform = function(x)
                return fzf_lua.utils.ansi_codes.magenta(x)
            end
            opts.actions = {
                ['default'] = function(selected)
                    vim.api.nvim_chan_send(tonumber(selected[1]), cmd)
                end
            }
            fzf_lua.fzf_exec(terminal_ids, opts)
        end

    end
end

return M
