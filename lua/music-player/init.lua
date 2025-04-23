local M = {}

local musics_directory = '~/Music'
local job = require('job')

local jobid

function M.get_musics()
    if type(musics_directory) == 'string' then
        return vim.fn.globpath(musics_directory, '*.mp3', 0, 1)
    else
        local rst = {}
        for _, v in ipairs(musics_directory) do
            for _, m in ipairs(vim.fn.globpath(v, '*.mp3', 0, 1)) do
                table.insert(rst, m)
            end
        end
        return rst
    end
end

function M.play(m)
    job.stop(jobid)
    jobid = job.start({ 'ffplay', m, '-autoexit', '-nodisp', '-volume', '30' })
end

function M.stop()
    job.stop(jobid)
end

function M.setup(opt)
    -- this can be a string or a list of string
    musics_directory = opt.musics_directory
end

return M
