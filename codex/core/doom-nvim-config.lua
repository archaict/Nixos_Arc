-- doom_config - Doom Nvim user configurations file

-- PACKAGE
doom.use_package({ "catppuccin/nvim", name = "catppuccin" })
doom.use_package({ "github/copilot.vim"})
doom.use_package({
  "jay-babu/mason-null-ls.nvim",
  config = function()
    require("mason-null-ls").setup({
      ensure_installed = { "stylua" },
      automatic_installation = true,
      automatic_setup = true
    })
  end
})
doom.use_package({ "mfussenegger/nvim-ansible"})
doom.use_package({
  "ur4ltz/surround.nvim",
  config = function()
    require("surround").setup({mappings_style = "sandwich"})
  end
})

-- COLORSCHEME
doom.colorscheme = "catppuccin-mocha"

-- ADDING A KEYBIND
doom.use_keybind({
  {
    mode = 'n', {
      { ';', ':' , options = { silent = false } },
      { ':', ';' },
      { 'J', '10j' },
      { 'K', '10k' },
    }
  },
  {
    mode = 'i', {
      { 'jk', '<Esc>' },
      { '<C-j>', 'copilot#Accept("<CR>")', options = { expr = true, silent = true }},
      { '<C-k>', 'copilot#Accept("<Esc>")', options = { expr = true, silent = true }},
      { '<C-l>', 'copilot#Accept("<Tab>")', options = { expr = true, silent = true }},
      { '<C-h>', 'copilot#Accept("<S-Tab>")', options = { expr = true, silent = true }},
    }
  }
})

doom.use_keybind({
  {'<leader>', name ='leader', {
    { 'jj', '<cmd>bnext<CR>' },
    { 'kk', '<cmd>bprev<CR>' },
    { 'bk', '<cmd>bdelete<CR>' },
    { 'wq', '<cmd>close<CR>' },
  }},
  -- { '<C-e>', {
  --   { '<C-e>', '<cmd>ToggleTerm <CR>'}
  -- }}
})


-- Define the function to change the current working directory to the project root
function change_cwd_to_project_root()
  -- Define the root directory of the project
  local project_root = vim.fn.finddir('.project', '.;')

  -- If the project root directory exists, change the current working directory to it
  if project_root ~= "" and vim.fn.isdirectory(project_root) == 1 then
    vim.cmd('cd ' .. project_root)
    print('Changed current working directory to ' .. project_root)
  else
  end
end

doom.use_autocmd({
  {
    "BufEnter","*",
    function()
      change_cwd_to_project_root()
    end
  },
})


-- AUTOCOMMANDS
doom.use_autocmd({
  {
    "ColorScheme","",
    function()
      vim.cmd("hi Normal ctermbg=none guibg=none")
      vim.cmd("hi NonText ctermbg=none guibg=none")
    end
  },
})

-- vim: sw=2 sts=2 ts=2 expandtab
