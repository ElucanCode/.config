local function width_ratio(width)
    if width > 150 then
        return 0.25
    elseif width > 100 then
        return 0.35
    elseif width > 50 then
        return 0.5
    else
        return 0.8
    end
end

local function height_ratio(height)
    if height > 40 then
        return 0.5
    elseif height > 30 then
        return 0.6
    else
        return 0.8
    end

end

require('nvim-tree').setup({
    view = {
        float = {
            enable = true,
            open_win_config = function()
                local screen_w = vim.opt.columns:get()
                local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                local window_w = screen_w * width_ratio(screen_w)
                local window_h = screen_h * height_ratio(screen_h)
                local window_w_int = math.floor(window_w)
                local window_h_int = math.floor(window_h)
                local center_x = (screen_w - window_w) / 2
                local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
                return {
                    border = 'rounded',
                    relative = 'editor',
                    row = center_y,
                    col = center_x,
                    width = window_w_int,
                    height = window_h_int,
                }
                end,
        },
        width = function()
            local width = vim.opt.columns:get()
            return math.floor(width * width_ratio(width))
        end,
    },
})
