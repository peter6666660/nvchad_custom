-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

-- closes tab + other buffers except the current one
local function closeOtherBufs (c_buf)
  for _, buf in ipairs(vim.t.bufs) do
    if buf ~=  c_buf then
      require('nvchad_ui/tabufline').close_buffer(buf)
    end
  end
end

vim.api.nvim_create_user_command("BufCloseOther", function()
  closeOtherBufs(vim.api.nvim_get_current_buf())
end, {})
