# music-player.nvim

## Requirements

- mpv
- telescope.nvim

## Installation

```lua
require('plug').add({
    {
        'wsdjeg/music-player.nvim',
        depends = { { 'nvim-telescope/telescope.nvim' } },
        enable = function()
            return vim.fn.executable('mpv') == 1
        end,
        config = function()
            require('music-player').setup({
                musics_directory = 'D:\\musics',
            })
            vim.keymap.set(
                'n',
                '<leader>ms',
                '<cmd>lua require("music-player").stop()<cr>',
                { silent = true }
            )
            vim.keymap.set('n', '<leader>mf', '<cmd>Telescope music-player<cr>', { silent = true })
        end,
    },
})
```

## Usage

- `:Telescope music-player`
