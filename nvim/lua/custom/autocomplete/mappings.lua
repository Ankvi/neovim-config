local cmp = require("cmp")
local luasnip = require("luasnip")

local select_previous_or_jump_back = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end

local select_next_or_jump_forward = function(fallback)
    if cmp.visible() then
        if #cmp.get_entries() == 1 then
            cmp.confirm({ select = true })
        else
            cmp.select_next_item()
        end
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        fallback()
    end
end

---@type table<string, cmp.Mapping>
return {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping({
        i = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace })
            else
                fallback()
            end
        end,
        s = cmp.mapping.confirm({ select = true }),
    }),
    ["<S-Tab>"] = cmp.mapping(select_previous_or_jump_back, { "i", "s", "c" }),
    ["<Tab>"] = cmp.mapping(select_next_or_jump_forward, { "i", "s", "c" }),
}
