# relative-toggle.nvim

## Installation

### [lazy.nvim](https://github.com/folke/lazy.nvim)

```lua
{
  "togawalk/relative-toggle.nvim",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  }
}
```

## Configuration

**relative-toggle.nvim** comes with the following defaults:

```lua
{
    relativenumber = true,
    pattern= "*",
    events = {
        on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
        off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
    },
}
```

## Usage

Toggle relative numbers with `:ToggleRelativeNumber`.

or 

```lua
-- -- line numbers
vim.keymap.set("n", "<leader>rn", "<cmd> ToggleRelativeNumber <CR>", { desc = "Toggle relative number" })
```
