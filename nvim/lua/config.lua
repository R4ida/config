
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
end


---------------------------------------------------------------------------------
-- I have no idea whats going on here...

-- @todo: split into multiple files
-- LSP config
-- require("mason").setup()
-- require("mason-lspconfig").setup({
--   ensure_installed = { "pyright", "sumneko_lua", "clangd" }
-- })

-- require("lspconfig").pyright.setup {}
-- require'lspconfig'.clangd.setup{}
-- require'lspconfig'.ccls.setup{}
-- require'lspconfig'.sumneko_lua.setup{}

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

-- lua function for formatting
ColorcolumnNum = 79
Colorcolumn=tostring(ColorcolumnNum)
vim.opt.colorcolumn = '0'
function ToggleColumn ()
  if vim.o.colorcolumn == '0'
    then vim.o.colorcolumn = Colorcolumn 
    else vim.o.colorcolumn = '0' 
  end
end

vim.keymap.set('n', '<Leader>[', function() ToggleColumn() end)


-- function SplitLineByColorcolumn (line)
--   lines = {}
--   while #line >= ColorcolumnNum do 
--     foundSplit = false
--     -- find first space to make split
--     for i=ColorcolumnNum, ColorcolumnNum*0.3, -1 do
--       if line:sub(i:i) == ' ' then
--         table.insert(lines, line:sub(0, i-1))
--         line = line:sub(i+1, #line-1)
--         break
--         foundSplit = true
--       end
--     end
--     if not foundSplit then
--         table.insert(lines, line:sub(0, 78))
--         line = line:sub(78, #line-1)
--     end
--   end
-- end

function AutoNewline ()
  visualPosition = vim.fn.line('v')
  cursorPosition = vim.fn.line('.')

  print('visualPosition:', visualPosition, 'cursorPosition:',  cursorPosition )
  -- visualPosition: 1 cursorPosition: 8

  first = visualPosition 
  second = cursorPosition 

  print(type(first))

  if first > second then first, second = second, first end

  -- lines = {}
  -- for line in vim.fn.getline(visualPosition, cursorPosition) do
  --   while #line >= ColorcolumnNum do 
  --     foundSplit = false
  --     -- find first space to make split
  --     for i=ColorcolumnNum, ColorcolumnNum*0.3, -1 do
  --       if line:sub(i:i) == ' ' then
  --         table.insert(lines, line:sub(0, i-1))
  --         line = line:sub(i+1, #line-1)
  --         break
  --         foundSplit = true
  --       end
  --     end
  --     if not foundSplit then
  --         table.insert(lines, line:sub(0, 78))
  --         line = line:sub(78, #line-1)
  --     end
  --   end
  -- end

  -- clear lines in selection
  -- tostring(first) .. 'gg'
  -- vim.fn.normal('dd')
  -- vim.fn.normal('5gg')
  -- vim.fn.normal(tostring(second-first+1) .. 'dd')

end
-- vim.keymap.set({'n', 'v'}, '<Leader>e', function() AutoNewline() end)

-- function DeleteLine ()
--   vim.fn.normal('dd')
-- end
-- vim.keymap.set({'n', 'v'}, '<Leader>d', function() DeleteLine() end)
--
--

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }
end)

-- require("neo-tree").setup({
--   window = {
--     mappings = {
--       ["<space>"] = "none",
--       ["o"] = "toggle_node"
--     }
--   }
-- })
