local M = {}
local cmd = vim.cmd
local uv = vim.loop -- Libuv API. See https://github.com/luvit/luv/blob/master/docs.md

-- Highlights functions
-- Define bg color
-- @param group Group
-- @param color Color
M.bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- From https://github.com/luvit/luv/blob/master/examples/timers.lua
M.set_timeout = function(timeout, callback)
  local timer = uv.new_timer()
  local function ontimeout()
    uv.timer_stop(timer)
    uv.close(timer)
    -- print(vim.inspect("SET_TIMEOUT DONE CALLING CALLBACK"))
    callback(timer)
  end
  uv.timer_start(timer, timeout, 0, ontimeout)
  return timer
end

M.clear_timeout = function(timer)
  if timer then
    uv.timer_stop(timer)
    uv.close(timer)
  end
end

M.set_interval = function(interval, callback)
  local timer = uv.new_timer()
  local function ontimeout()
    callback(timer)
  end
  uv.timer_start(timer, interval, interval, ontimeout)
  return timer
end

M.clear_interval = M.clear_timeout

-- (...) spread documentation https://www.lua.org/pil/5.2.html
M.debounce = function(delay, fn)
  local timeout = nil
  return function() -- assigns "arg" variable to the table of arguments
    -- Maybe calling this with nil will throw an error
    M.clear_timeout(timeout) -- Clear the previous timer if we are called again
    -- print(vim.inspect("DEBOUNCE -> RE-CALLED -> CANCEL"))
    timeout = M.set_timeout(delay, function(_timer)
      -- print(vim.inspect("DEBOUNCE -> EXECUTE"))
      return fn()
    end)
  end
end

M.once_then_debounce = function(delay, fn)
  local called_once = false
  local timeout = nil
  return function()
    if not called_once then
      called_once = true
      -- print(vim.inspect("once_then_debounce -> FIRST CALL"))
      fn()
    end
    M.clear_timeout(timeout)
    timeout = M.set_timeout(delay, function(_timer)
      -- print(vim.inspect("once_then_debounce -> LAST CALL"))
      return fn()
    end)
  end
end

return M
