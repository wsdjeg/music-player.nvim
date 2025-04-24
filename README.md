# music-player.nvim

## Requirements

- mpv
- telescope.nvim

## Installation

```lua
require('plug').add({
    {
        'D:/wsdjeg/music-player.nvim',
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
