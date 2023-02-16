
local ok, telescope = pcall(require, "telescope")
if not ok then
  print("error requiring telescope")
  return
end

local actions_ok, actions = pcall(require, "telescope.actions")
if not actions_ok then
  print("error requiring telescope actions")
  return
end

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
telescope.setup({
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
        ['<C-k>'] = actions.move_selection_previous,
        ['<C-j>'] = actions.move_selection_next,
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

-- Enable telescope fzf native, if installed
local fzf_ok, _ = pcall(telescope.load_extension, "fzf")
if not fzf_ok then
  print("error loading extension telescope fzf. continuing to configure telescope")
end

-- telescope keymaps
local keymap = vim.keymap

local telescope_builtin_ok, telescope_builtin =  pcall(require, 'telescope.builtin')
if not telescope_builtin_ok then
  print("error requiring telescope builtin")
  return
end

local telescope_themes_ok, telescope_themes = pcall(require, 'telescope.themes')
if not telescope_themes_ok then
  print("error requiring telescope themes")
  return
end

-- See `:help telescope.builtin`
keymap.set('n', '<leader>?', telescope_builtin.oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader><space>', telescope_builtin.buffers, { desc = '[ ] Find existing buffers' })
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  telescope_builtin.current_buffer_fuzzy_find(telescope_themes.get_dropdown {
    winblend = 10,
    previewer = false,
  })

end, { desc = '[/] Fuzzily search in current buffer]' })

keymap.set('n', '<leader>lf', telescope_builtin.find_files, { desc = '[L]look [F]iles' })
keymap.set('n', '<leader>lh', telescope_builtin.help_tags, { desc = '[L]ook [H]elp' })
keymap.set('n', '<leader>lw', telescope_builtin.grep_string, { desc = '[L]ook current [W]ord' })
keymap.set('n', '<leader>lg', telescope_builtin.live_grep, { desc = '[L]ook by [G]rep' })
keymap.set('n', '<leader>ld', telescope_builtin.diagnostics, { desc = '[L]ook [D]iagnostics' })
keymap.set('n', '<leader>lr', telescope_builtin.resume, {desc = '[l]ook [R]esume' })

