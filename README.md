# music-player.nvim

A simple music player for Neovim.

## Requirements

- ffmpeg

## Installation

Using [nvim-plug](https://github.com/wsdjeg/nvim-plug)

```lua
return {
    'wsdjeg/music-player.nvim',
    depends = { { 'wsdjeg/job.nvim' } },
    opts = {
        musics_directory = '~/Music',
    },
    keys = {
        {
            'n',
            '<leader>ms',
            '<cmd>lua require("music-player").stop()<cr>',
            { silent = true, desc = 'stop musics player' },
        },
        {
            'n',
            '<leader>mf',
            '<cmd>Picker music-player<cr>',
            { silent = true, desc = 'fuzzy find music' },
        },
    },
}
```

## Usage

this plugin also provides `music-player` source for [picker.nvim](https://github.com/wsdjeg/picker.nvim) or [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).

```
:Picker music-player
```
