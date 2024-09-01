
-- change colorscheme to light if terminal theme has light theme
-- works checking current terminal background color setting
-- @todo: make it work without restarting
--        callback on config file edit? how to do this

-- colors: #002b36 #fdf6e3
XFCE_TERMINAL_BACKGROUND_LIGHT = "#fdf6e3"

-- run this one instead: xfconf-query -c xfce4-terminal -p /color-background
local handle = io.popen('xfconf-query -c xfce4-terminal -p /color-background')
local current_terminal_background_color = handle:read()
handle:close()

if current_terminal_background_color == XFCE_TERMINAL_BACKGROUND_LIGHT then
 vim.api.nvim_command('set background=light')
 vim.api.nvim_command('colorscheme solarized')
else
 vim.api.nvim_command('set background=dark')
 vim.api.nvim_command('set notermguicolors')
 vim.api.nvim_command('colorscheme vim')
end


---------------------------------------------------------------------------------

-- treesitter
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- (the four listed parsers should always be installed)
  ensure_installed = { "c", "cpp", "python", "bash", "lua", "vim",
                       "latex", "markdown" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitterNeotree`
  -- CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype.
    -- (for example if you want to disable highlighting for the `tex`
    -- filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Or use a function for more flexibility, e.g. to disable slow treesitter
    -- highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB XXX: do I even want this?
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same
    -- time. Set this to `true` if you depend on 'syntax' being enabled
    -- (like for indentation). Using this option may slow down your editor,
    -- and you may see some duplicate highlights. Instead of true it can also
    -- be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
