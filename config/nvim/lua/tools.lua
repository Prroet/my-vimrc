TerminalToggle = {}

local vim = vim
local api = vim.api

local function CreateTerminal()
  local old = vim.o.splitbelow
  vim.o.splitbelow = true
  api.nvim_exec("botright+20split+terminal", true)
  vim.o.splitbelow = old
  local win = api.nvim_get_current_win()
  local buf = api.nvim_get_current_buf()
  return { window = win, buffer = buf }
end

local function OpenWindow(buffer)
  local old = vim.o.splitbelow
  vim.o.splitbelow = true
  vim.cmd("botright+20split+buffer"..buffer)
  vim.o.splitbelow = old
  return api.nvim_get_current_win()
end

function TerminalToggle.toggle()
  local tabpage = api.nvim_get_current_tabpage()
  local tabpage_number = api.nvim_tabpage_get_number(tabpage)
  -- check if there is a valid buffer
  -- then check if there is a valid window
  -- if no valid buffer -> there is no terminal
  -- if valid buffer but no window -> the window is closed
  -- print("TerminalToggle[".. tabpage_number .. "]=".. "nil" or TerminalToggle[tabpage_number] .. "\n")
  if TerminalToggle[tabpage_number] ~= nil then
    -- print("Tabpage exists. Checking if buffer is loaded")
    local buffer = TerminalToggle[tabpage_number].buffer
    local window = TerminalToggle[tabpage_number].window
    if api.nvim_buf_is_loaded(buffer) then
      if api.nvim_win_is_valid(window) then
        print("Closing Window")
        api.nvim_win_close(window, false)
      else
        TerminalToggle[tabpage_number].window = OpenWindow(buffer)
        window = TerminalToggle[tabpage_number].window
      end
    else
      -- print("Buffer: " .. buffer .. " is not loaded!")
      -- print("Creating new Terminal")
      TerminalToggle[tabpage_number] = CreateTerminal()
    end
  else
    print("Creating terminal.")
    TerminalToggle[tabpage_number] = CreateTerminal()
  end
end
