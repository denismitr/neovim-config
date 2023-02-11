-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- general Keymaps
keymap.set('i', 'jk', "<ESC>") -- exit insert mode

keymap.set("n", "<leader>nh", ":nohl<CR>") -- clear hignlights

keymap.set("n", "x", '"_x') -- delete word

-- increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- telescope keymaps

-- See `:help telescope.builtin`
keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

keymap.set('n', '<leader>lf', require('telescope.builtin').find_files, { desc = '[L]look [F]iles' })
keymap.set('n', '<leader>lh', require('telescope.builtin').help_tags, { desc = '[L]ook [H]elp' })
keymap.set('n', '<leader>lw', require('telescope.builtin').grep_string, { desc = '[L]ook current [W]ord' })
keymap.set('n', '<leader>lg', require('telescope.builtin').live_grep, { desc = '[L]ook by [G]rep' })
keymap.set('n', '<leader>ld', require('telescope.builtin').diagnostics, { desc = '[L]ook [D]iagnostics' })
keymap.set('n', '<leader>lr', require('telescope.builtin').resume, {desc = '[l]ook [R]esume' })

-- vim maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

