local M = {}

local musics_directory = 'D:\\wsdjeg\\my-blog\\docs\\musics'
local job = require('job')

local jobid

function M.get_musics()
    return vim.fn.globpath(musics_directory, '*.mp3', 0, 1)
end

function M.play(m)
    job.stop(jobid)
    jobid = job.start({ 'ffplay', entry.value, '-autoexit', '-nodisp' })
end

function M.stop()
    job.stop(jobid)
end

return M
