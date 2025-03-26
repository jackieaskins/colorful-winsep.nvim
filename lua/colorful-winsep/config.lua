local M = {
  default = {
    symbols = { "━", "┃", "┏", "┓", "┗", "┛" },
    no_exec_files = { "packer", "TelescopePrompt", "mason", "CompetiTest" },
    hi = { fg = "#957CC6", bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg },
    events = { "WinEnter", "WinResized", "SessionLoadPost" },
    smooth = true,
    exponential_smoothing = true,
    only_line_seq = true,
    anchor = {
      left = { height = 1, x = -1, y = -1 },
      right = { height = 1, x = -1, y = 0 },
      up = { width = 0, x = -1, y = 0 },
      bottom = { width = 0, x = 1, y = 0 },
    },
    light_pollution = function(_) end,
  },
  auto_group = vim.api.nvim_create_augroup("NvimSeparator", { clear = true }),
}

function M:merge_options(opts)
  if type(opts) == "table" and opts ~= {} then
    self.default = vim.tbl_deep_extend("force", self.default, opts)
  end
  return self.default
end

function M.highlight()
  local opts = M.default.hi

  if vim.tbl_isempty(vim.api.nvim_get_hl(0, { name = "NvimSeparator" })) then
    vim.api.nvim_set_hl(0, "NvimSeparator", opts)
  end
end

return M
