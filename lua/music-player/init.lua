local M = {}

local musics_directory = '~/Music'
local job = require('job')
local logger = require('music-player.logger')

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
    logger.info(string.format('start playing %s', vim.fn.fnamemodify(m, ':t')))
    job.stop(jobid)
    jobid = job.start({ 'ffplay', '-autoexit', '-nodisp', '-volume', '30', m }, {
        on_exit = function(id, code, signal)
            logger.info(string.format('ffplay exit with code=%s, signal=%s', code, signal))
            if code == 0 and signal == 0 then
                local ms = M.get_musics()
                M.play(ms[math.random(#ms)])
            end
        end,
    })
    job.chanclose(jobid, 'stderr')
end

function M.stop()
    job.stop(jobid)
end

function M.setup(opt)
    -- this can be a string or a list of string
    musics_directory = opt.musics_directory
end

return M
