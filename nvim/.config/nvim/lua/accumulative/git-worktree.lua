local Worktree = require("git-worktree")

function trim1(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

local M = {}
function M.execute(op, path)
  require('nvim-projectconfig').load_project_config()
  if vim.fn.filereadable('./.env') == 0 then
    local handle = io.popen("git worktree list | grep -v wt | awk '{print $1}' | xargs -I '{}' echo '{}/.env'")
    local result = handle:read("*a")
    handle:close()
    local envpath = trim1(result)
    if vim.fn.filereadable(envpath) == 1 then
      os.execute("cp " .. envpath .. ' ./.env')
    end
  end
end

Worktree.on_tree_change(function(op, path, _ --[[upstream]])
  M.execute(op, path.path)
end)

return M
