local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

treesitter.setup {
    ensure_installed = "all",
    ignore_install = { "" },
    highlight = {
        enable = true,
        disable = { "" },
        --additional_vim_regex_highlighting = true,
    },
    --indent = { enable = true, disable = { "yaml" } },
    playground = {
        enable = true,
    },
    query_linter = {
        enable = true,
    },
}
