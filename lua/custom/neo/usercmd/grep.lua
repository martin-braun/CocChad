-- Grep
vim.api.nvim_create_user_command(
  'Grep',
  function(opts)
    if #opts.args < 1 then
      print("Usage: :Grep(!) <pattern> <filter?>, i.e. :S /my_string/g **/*, or :S! /my_string/my_replacement/g **/*")
      return
    end
    local pattern = opts.fargs[1]
    local filter = opts.fargs[2] or "**/*"
    local segmno = 1
    local searchpatt = nil
    local replpatt = nil
    local flags = nil
    for pattsegm in string.gmatch(pattern, "([^/]+)") do
      if segmno == 1 then
        searchpatt = pattsegm
      elseif segmno == 2 then
        if not opts.bang then
          flags = pattsegm
        else
          replpatt = pattsegm
        end
      elseif segmno == 3 then
        flags = pattsegm
      else
        break
      end
      segmno = segmno + 1
    end
    if searchpatt and flags and filter then
      vim.cmd(":vimgrep /" .. searchpatt .. "/" .. flags .. "j " .. filter)
      vim.cmd(":cw")
      vim.cmd(":.cc")
      if opts.bang and replpatt then
        vim.cmd(":cfdo %s/" .. searchpatt .. "/" .. replpatt .. "/" .. flags .. "e")
      end
    end
  end,
  { nargs = '*', bang = true }
)

