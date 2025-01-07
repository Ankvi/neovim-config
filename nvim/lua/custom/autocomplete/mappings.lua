local cmp = require("cmp")
local types = require("cmp.types")
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
        cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        fallback()
    end
end

local snippet_forward = function(fallback)
    if luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
    else
        fallback()
    end
end

local snippet_backward = function(fallback)
    if luasnip.jumpable(-1) then
        luasnip.jump(-1)
    else
        fallback()
    end
end

local select_next = function(fallback)
    if cmp.visible() then
        cmp.select_next_item({ behavior = types.cmp.SelectBehavior.Insert })
    else
        fallback()
    end
end

local select_previous = function(fallback)
    if cmp.visible() then
        cmp.select_prev_item({ behavior = types.cmp.SelectBehavior.Insert })
    else
        fallback()
    end
end

---@type table<string, cmp.Mapping>
return {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-u>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping({
        i = function(fallback)
            -- if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ select = true })
            -- cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace })
            -- else
            --     fallback()
            -- end
        end,
        s = cmp.mapping.confirm({ select = true }),
    }),
    ["<C-n>"] = cmp.mapping(select_next, { "i", "s", "c" }),
    ["<C-p>"] = cmp.mapping(select_previous, { "i", "s", "c" }),
    -- ["<S-Tab>"] = cmp.mapping(select_previous_or_jump_back, { "i", "s", "c" }),
    -- ["<Tab>"] = cmp.mapping(select_next_or_jump_forward, { "i", "s", "c" }),
    -- ["<S-Tab>"] = cmp.mapping(snippet_backward, { "i", "s" }),
    -- ["<Tab>"] = cmp.mapping(snippet_forward, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping({
        i = snippet_backward,
        s = snippet_backward,
        c = select_previous,
    }),
    ["<Tab>"] = cmp.mapping({
        i = snippet_forward,
        s = snippet_forward,
        c = select_next,
    }),
}
