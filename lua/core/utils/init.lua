local M = {}

function M.executable(n)
    return vim.fn.executable(n) > 0
end

return M
