local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    base00 = "#10111b",
    base01 = "#1d1a2a",
    base02 = "#262237",
    base03 = "#645d74",
    base04 = "#c8b9ca",
    base05 = "#eee7f0",
    base06 = "#eee7f0",
    base07 = "#eee7f0",
    base08 = "#f08a9b",
    base09 = "#7fb6d6",
    base0A = "#afa2d8",
    base0B = "#e6a6c8",
    base0C = "#96cae9",
    base0D = "#e996c2",
    base0E = "#aa96e9",
    base0F = "#b4132e",
  })

  local groups = {
    "Normal",
    "NormalNC",
    "NormalFloat",
    "SignColumn",
    "LineNr",
    "CursorLineNr",
    "EndOfBuffer",
    "FoldColumn",
    "StatusLine",
    "StatusLineNC",
    "WinBar",
    "WinBarNC",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "NONE", ctermbg = "NONE" })
  end
end

local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["noctalia"] = nil
    require("noctalia").setup()
  end)
)

return M
