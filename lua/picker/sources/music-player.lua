local M = {}

local mp = require('music-player')
function M.get()
    return vim.tbl_map(function(t)
        return { value = t, str = vim.fn.fnamemodify(t, ':t:r') }
    end, mp.get_musics())
end

function M.default_action(entry)
    mp.play(entry.value)
end

return M
