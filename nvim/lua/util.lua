local M = {}

M.get_lang = function ()
    if vim.fn.filereadable("Cargo.toml") == 1 then
        return "rust"
    elseif vim.fn.filereadable("CMakeLists.txt") == 1 then
        return "cmake"
    elseif vim.fn.filereadable("Makefile") == 1 then
        return "make"
    else
        return nil
    end
end

M.is_lang = function (lang)
    if type(lang) ~= "string" then return false end
    return M.getlang() == lang
end

M.is_project = function (name)
    return string.find(vim.fn.getcwd(), name)
end

return M
