local M = {}

M.cur_file = function()
    return vim.fn.expand('%:t')
end

M.get_proj_lang = function()
    if vim.fn.filereadable("Cargo.toml") == 1 then
        return "rust"
    elseif vim.fn.filereadable("CMakeLists.txt") == 1 then
        return "cmake"
    elseif vim.fn.filereadable("Makefile") == 1 then
        return "make"
    elseif vim.fn.filereadable("main.tex") == 1 then
        return "latex"
    else
        return nil
    end
end

M.is_lang = function(lang)
    if type(lang) ~= "string" then return false end
    return M.get_proj_lang() == lang
end

M.is_project = function(name)
    return string.find(vim.fn.getcwd(), name)
end

M.load_telescope_extensions = function()
    require("telescope").load_extension("file_browser")
end

return M
