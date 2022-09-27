local M = {}

M = require("aaron.telescope.custom.nipro").merge(M)
M = require("aaron.telescope.custom.git").merge(M)

return M
