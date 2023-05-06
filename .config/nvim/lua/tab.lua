local MyTabLine = {}
_G.MyTabLine = MyTabLine -- export global

local get_buf_id = function(tab_num)
    local buflist = vim.fn.tabpagebuflist(tab_num)
    local winnr = vim.fn.tabpagewinnr(tab_num)
    local buf_id =  buflist[winnr]
    return buf_id
end

local set_highlight = function()
    local has_catppuccin, catppuccin, C
    has_catppuccin, catppuccin = pcall(require, 'catppuccin.palettes')
    if has_catppuccin then
        C = catppuccin.get_palette('macchiato')
        vim.api.nvim_set_hl(0, 'TabLineSelModified', { fg = C.red, bg = C.surface1 })
        vim.api.nvim_set_hl(0, 'TabLineModified', { fg = C.red })
    end
end

MyTabLine.label = function(tab_num, buf_id)
    local name = vim.fn.bufname(buf_id)
    local label = vim.fn.fnamemodify(name, ':t')

    -- add icon
    local has_devicons, devicons
    has_devicons, devicons = pcall(require, 'nvim-web-devicons')
    if has_devicons then
        local extension = vim.fn.fnamemodify(label, ':e')
        local icon = devicons.get_icon(label, extension, { default = true })
        label = string.format(' %s %s ', icon, label)
    end

    label = ' ' .. tab_num .. ' ' .. label -- add tab number in label

    return label
end

MyTabLine.tabline = function()
    set_highlight()

    local tabline = ''
    local num_tabs = vim.fn.tabpagenr('$') -- get total tab pages
    for tabpage = 1, num_tabs do
        local buf_id = get_buf_id(tabpage)
        local current_tab = vim.fn.tabpagenr() -- get current tab page number

        -- Set selected tab and unselected tab
        local highlight_type = ''
        if current_tab == tabpage then
            highlight_type = '%#TabLineSel#'
            if vim.api.nvim_buf_get_option(buf_id, 'modified') then
                highlight_type = '%#TabLineSelModified#'
            end
        else
            highlight_type = '%#TabLine#'
            if vim.api.nvim_buf_get_option(buf_id, 'modified') then
                highlight_type = '%#TabLineModified#'
            end
        end
        tabline = tabline .. highlight_type

        -- Set tabpage number
        tabline = tabline .. ('%%%dT'):format(tabpage)

        -- Set tab label
        tabline = tabline .. (' %%%s '):format(MyTabLine.label(tabpage, buf_id))
    end

    tabline = tabline .. '%#TabLineFill#%T'

    return tabline
end

-- vim.api.nvim_create_user_command("MyTabLine", MyTabLine.tabline, {})

vim.o.showtabline = 2
vim.o.hidden = true
vim.o.tabline = '%!v:lua.MyTabLine.tabline()'
