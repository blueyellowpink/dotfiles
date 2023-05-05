local MyTabLine = {}

_G.MyTabLine = MyTabLine -- export global

-- local buflist = vim.fn.tabpagebuflist(1)
-- -- for _, win in ipairs(buflist) do
-- --     print(win)
-- -- end
-- -- print(buflist[1])
--
-- local winnr = vim.fn.tabpagewinnr(1)
-- local name = vim.fn.bufname(buflist[winnr])
-- print(name)

MyTabLine.label = function(tab_num)
    -- local buf = vim.api.nvim_call_function("tabpagebuflist", {})
    -- for _, win in ipairs(buf) do
    --     print(win)
    -- end
    --
    -- local buf2 = vim.api.nvim_call_function("tabpagebuflist", { 2 })
    -- for _, win in ipairs(buf2) do
    --     print(win)
    -- end
    --

    local buflist = vim.fn.tabpagebuflist(tab_num)
    local winnr = vim.fn.tabpagewinnr(tab_num)
    local name = vim.fn.bufname(buflist[winnr])
    local label = tab_num .. ' ' .. vim.fn.fnamemodify(name, ':t')
    -- local label = tab_num .. ' ' .. name

    -- add icon
    local has_devicons, devicons
    has_devicons, devicons = pcall(require, 'nvim-web-devicons')
    if has_devicons then
        local extension = vim.fn.fnamemodify(label, ':e')
        local icon = devicons.get_icon(label, extension, { default = true })
        label = string.format(' %s %s ', icon, label)
        return label
    end

    return tab_num .. '%.lua'
end

MyTabLine.tabline = function()
    local tabline = ''
    local num_tabs = vim.fn.tabpagenr('$')
    for current = 1, num_tabs do
        local tabpagenr = vim.fn.tabpagenr()
        -- Set selected tab and unselected tab
        if current == tabpagenr then
            tabline = tabline .. '%#TabLineSel#'
        else
            tabline = tabline .. '%#TabLine#'
        end
        -- Set tabpage number
        tabline = tabline .. ('%%%dT'):format(current)
        -- Set tab label
        tabline = tabline .. (' %%%s '):format(MyTabLine.label(current))
    end
    tabline = tabline .. '%#TabLineFill#%T'
    return tabline
end

vim.api.nvim_create_user_command("MyTabLine", MyTabLine.tabline, {})

vim.o.showtabline = 2
vim.o.hidden = true
vim.o.tabline = '%!v:lua.MyTabLine.tabline()'
