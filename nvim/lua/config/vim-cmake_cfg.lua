vim.g.cmake_link_compile_commands = 1
vim.g.cmake_build_dir_location = './build'
vim.g.cmake_build_options = {
    '-j8',
}

local pwd = vim.fn.getcwd()
if string.find(pwd, "poseidon") then
    vim.g.cmake_generate_options = {
        '-DUSE_PMDK=OFF',
        '-DUSE_PFILE=OFF',
        '-DUSE_LLVM=ON',
        '-DQOP_RECOVERY=OFF',
    }
end
