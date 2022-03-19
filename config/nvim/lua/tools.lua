TerminalToggle = {}

local vim = vim

local function CreateTerminal(tabpage_number)
  local old_splitbelow = vim.go.splitbelow
  vim.go.splitbelow = true
  vim.cmd('20split+terminal')
  vim.wo.winfixheight = true
  vim.go.splitbelow = old_splitbelow
  TerminalToggle[tabpage_number].buffer = vim.api.nvim_get_current_buf()
  TerminalToggle[tabpage_number].window = vim.api.nvim_get_current_win()
  return { buffer = TerminalToggle[tabpage_number].buffer, window = TerminalToggle[tabpage_number].window }
end

local function OpenWindow(tabpage_number)
  local old_splitbelow = vim.go.splitbelow
  vim.go.splitbelow = true
  vim.cmd('20split')
  vim.wo.winfixheight = true
  vim.go.splitbelow = old_splitbelow
  TerminalToggle[tabpage_number].window = vim.api.nvim_get_current_win()
  vim.api.nvim_win_set_buf(TerminalToggle[tabpage_number].window, TerminalToggle[tabpage_number].buffer)
  return TerminalToggle[tabpage_number].window
end

local function CloseWindow(tabpage_number)
  local window = TerminalToggle[tabpage_number].window
  vim.api.nvim_win_close(window)
end

function TerminalToggle.toggle()
  local tabpage = vim.api.nvim_get_current_tabpage()
  local tabpage_number = vim.api.nvim_tabpage_get_number(tabpage)
  local buffer = nil
  local window = nil
  -- there was a terminal
  if TerminalToggle[tabpage_number] ~= nil then
    buffer = TerminalToggle[tabpage_number].buffer
    window = TerminalToggle[tabpage_number].window
  else
    -- no terminal before
    TerminalToggle[tabpage_number] = {}
  end
  -- no terminal before
  if buffer == nil then
    vim.cmd('echo "Buffer is nil creating terminal"')
    local win_and_buf = CreateTerminal(tabpage_number)
    buffer = win_and_buf.buffer
    window = win_and_buf.window
  end

  -- terminal was closed
  if not vim.api.nvim_buf_is_valid(buffer) then
    local win_and_buf = CreateTerminal(tabpage_number)
    buffer = win_and_buf.buffer
    window = win_and_buf.window
  end

  if not vim.api.nvim_win_is_valid(window) then
    window = OpenWindow(tabpage_number)
  else
    vim.api.nvim_win_close(window, false)
  end
end
