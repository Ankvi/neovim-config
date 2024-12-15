local icons = require("custom.icons.lspkind")

---@type fun(entry: cmp.Entry, vim_item: vim.CompletedItem): vim.CompletedItem
local function format(entry, vim_item)
    if icons[vim_item.kind] then
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
    end

    local source_name = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
    })[entry.source.name]

    vim_item.menu = source_name

    return vim_item
end

---@type cmp.FormattingConfig
---@diagnostic disable-next-line: missing-fields
return {
    format = format,
}
