local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'ui_colors',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = false,
    },
    -- | A | B | C         X | Y | Z |
    sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff',
            { 'diagnostics',
                symbols = { error = '✗', warn = '', info = '', hint = '' } }
        },

        lualine_x = { 'encoding', { 'filetype', colored = false }, '%L' },
        lualine_y = {},
        lualine_z = { 'progress', 'location' }
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' }
    },
    tabline = {},
    extensions = {}
}
vim.opt.showmode = false
