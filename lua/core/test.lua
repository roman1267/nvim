-- TODO: Need to getbufinfo() or api.nvim_buf_get_info to find information on no-name buffers.
-- If the last open buffer is a no-name buffer that was just created,
-- then need to :qall, otherwise the buffer is open for a reason so leave it alone.

local function is_no_name_buf(buf)
   return vim.api.nvim_buf_is_loaded(buf)
      and vim.api.nvim_buf_get_option(buf, "buflisted")
      and vim.api.nvim_buf_get_name(buf) == ""
      and vim.api.nvim_buf_get_option(buf, "buftype") == ""
      and vim.api.nvim_buf_get_option(buf, "filetype") == ""
end
