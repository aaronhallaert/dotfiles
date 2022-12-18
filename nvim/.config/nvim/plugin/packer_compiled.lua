-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/aaronhallaert/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/aaronhallaert/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/aaronhallaert/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/aaronhallaert/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/aaronhallaert/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25aaron.config.comment\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25aaron.config.luasnip\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ReplaceWithRegister = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/ReplaceWithRegister",
    url = "https://github.com/vim-scripts/ReplaceWithRegister"
  },
  ["ai.vim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/ai.vim",
    url = "https://github.com/aduros/ai.vim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\nÜ\1\0\0\a\0\v\0\"'\0\0\0006\1\1\0009\1\2\1B\1\1\0029\1\3\1'\2\4\0006\3\1\0009\3\2\3B\3\1\0029\3\5\3'\4\4\0006\5\1\0009\5\2\5B\5\1\0029\5\6\5&\0\5\0006\1\a\0\v\1\0\0X\1\2L\0\2\0X\1\f'\1\b\0006\2\1\0009\2\t\0026\4\a\0B\2\2\2\21\2\2\0'\3\n\0&\1\3\1\18\2\0\0\18\3\1\0&\2\3\2L\2\2\0K\0\1\0\r Plugins\rtbl_keys\v  ï \19packer_plugins\npatch\nminor\6.\nmajor\fversion\bvim\tï§ Ô\14\1\0\n\0000\1o6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\0016\0\5\0006\2\0\0'\3\1\0B\0\3\3\14\0\0\0X\2\12\0^6\2\0\0'\4\6\0B\2\2\0029\3\a\0029\3\b\0035\4\n\0=\4\t\0039\3\a\0029\3\v\0034\4\n\0009\5\f\2'\a\r\0'\b\14\0'\t\15\0B\5\4\2>\5\1\0049\5\f\2'\a\16\0'\b\17\0'\t\18\0B\5\4\2>\5\2\0049\5\f\2'\a\19\0'\b\20\0'\t\21\0B\5\4\2>\5\3\0049\5\f\2'\a\22\0'\b\23\0'\t\24\0B\5\4\2>\5\4\0049\5\f\2'\a\25\0'\b\26\0'\t\27\0B\5\4\2>\5\5\0049\5\f\2'\a\28\0'\b\29\0'\t\30\0B\5\4\2>\5\6\0049\5\f\2'\a\31\0'\b \0'\t!\0B\5\4\2>\5\a\0049\5\f\2'\a\"\0'\b#\0'\t$\0B\5\4\2>\5\b\0049\5\f\2'\a%\0'\b&\0'\t'\0B\5\4\0?\5\0\0=\4\t\0033\3(\0009\4\a\0029\4)\4\18\5\3\0B\5\1\2=\5\t\0049\4\a\0029\4)\0049\4*\4'\5,\0=\5+\0049\4\a\0029\4\b\0049\4*\4'\5-\0=\5+\0049\4\a\0029\4\v\0049\4*\4'\5.\0=\5+\0049\4*\0029\4*\4+\5\2\0=\5/\0049\4\2\0019\6*\2B\4\2\1K\0\1\0K\0\1\0\14noautocmd\16AlphaButton\16AlphaHeader\16AlphaFooter\ahl\topts\vfooter\0\r:qa!<CR>\21ï  Quit Neovim\6q\27:Telescope planets<CR>\19ðª  Planets?\6p\20:PackerSync<CR>\24ïª  Update Plugins\6u$:cd ~/dotfiles | e $MYVIMRC<CR>\23î  Configuration\6c\29:Telescope live_grep<CR>\19ï  Find Text\6tB:lua require('telescope.builtin').oldfiles{only_cwd=true}<CR>\22ï  Recent Files\6r :ene <BAR> startinsert <CR>\18ï  New file\6e\30:Telescope find_files<CR>\19ï¢  Find File\6f\31:Telekasten goto_today<CR>\20ï³  Daily Note\6d\vbutton\fbuttons\1\t\0\0\5\5\1 ââââ   âââââââââââ âââââââ âââ   ââââââââââ   ââââ \1 âââââ  âââââââââââââââââââââââ   âââââââââââ âââââ \1 ââââââ âââââââââ  âââ   ââââââ   âââââââââââââââââ \1 ââââââââââââââââ  âââ   âââââââ ââââââââââââââââââ \1 âââ âââââââââââââââââââââââ âââââââ ââââââ âââ âââ \1 âââ  âââââââââââââ âââââââ   âââââ  ââââââ     âââ \bval\vheader\fsection\27alpha.themes.dashboard\npcall\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\19À\4\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28aaron.config.bufferline\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["calendar-vim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/calendar-vim",
    url = "https://github.com/renerocksai/calendar-vim"
  },
  catppuccin = {
    config = { "\27LJ\2\nÞ\4\0\0\5\0\17\0003'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0\18\4\0\0&\3\4\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\n\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\v\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\f\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\r\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\14\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\15\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\16\0B\1\2\1K\0\1\0001hi OctoGreyFloat guifg=#2a254c guibg=#3034461hi OctoBlueFloat guifg=#58a6ff guibg=#3034463hi OctoYellowFloat guifg=#d3c846 guibg=#3034463hi OctoPurpleFloat guifg=#6f42c1 guibg=#3034460hi OctoRedFloat guifg=#da3633 guibg=#3034462hi OctoGreenFloat guifg=#238636 guibg=#303446\"hi OctoEditable guibg=#303446\28colorscheme catppuccin-\17nvim_command\bapi\bvim\fflavour\1\0\0\nsetup\15catppuccin\frequire\14macchiato\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cheat.sh-vim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cheat.sh-vim",
    url = "https://github.com/dbeniamine/cheat.sh-vim"
  },
  ["cinnamon.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26aaron.config.cinnamon\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cinnamon.nvim",
    url = "https://github.com/declancm/cinnamon.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-emoji"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["codicons.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/codicons.nvim",
    url = "https://github.com/mortepau/codicons.nvim"
  },
  ["continuous-testing.nvim"] = {
    config = { "\27LJ\2\nÉ\4\0\0\6\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\0025\3\f\0005\4\v\0005\5\n\0=\5\6\4=\4\r\0035\4\15\0005\5\14\0=\5\6\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\21project_override3/Users/aaronhallaert/Developer/nephroflow/link\1\0\0\1\0\2\rtest_cmd5docker exec channel_host bundle exec rspec %file\14test_tool\nrspec=/Users/aaronhallaert/Developer/nephroflow/nephroflow-api\1\0\0\1\0\0\1\0\2\rtest_cmd.run_api.sh -ni -- bundle exec rspec %file\14test_tool\nrspec\20framework_setup\15javascript\1\0\3\17root_pattern\18tsconfig.json\rtest_cmd\26yarn vitest run %file\14test_tool\vvitest\truby\1\0\0\1\0\2\rtest_cmd\28bundle exec rspec %file\14test_tool\nrspec\1\0\1\vnotify\2\nsetup\23continuous-testing\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/continuous-testing.nvim",
    url = "https://github.com/aaronhallaert/continuous-testing.nvim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  ["efmls-configs-nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/efmls-configs-nvim",
    url = "https://github.com/creativenull/efmls-configs-nvim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\vfidget\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["fold-preview.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/fold-preview.nvim",
    url = "https://github.com/anuvyklack/fold-preview.nvim"
  },
  ["friendly-snippets"] = {
    config = { "\27LJ\2\n\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0005\3\6\0B\0\3\1K\0\1\0\1\2\0\0\nrails\truby\20filetype_extend\fluasnip\14lazy_load luasnip.loaders.from_vscode\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["git-blame.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["git-worktree.nvim"] = {
    config = { "\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30aaron.config.git-worktree\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/git-worktree.nvim",
    url = "https://github.com/ThePrimeagen/git-worktree.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26aaron.config.gitsigns\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["guess-indent.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17guess-indent\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/guess-indent.nvim",
    url = "https://github.com/NMAC427/guess-indent.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25aaron.config.harpoon\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["hop.nvim"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21aaron.config.hop\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"aaron.config.indent_blankline\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["iswap.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23aaron.config.iswap\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/iswap.nvim",
    url = "https://github.com/mizlan/iswap.nvim"
  },
  ["live-command.nvim"] = {
    config = { "\27LJ\2\nB\0\1\4\0\4\1\n9\1\0\0\t\1\0\0X\1\2'\1\1\0X\2\19\1\0\0'\2\2\0009\3\3\0&\1\3\1L\1\2\0\targs\6@\5\ncountþÿÿÿ\31®\1\1\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0003\5\t\0=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\rcommands\1\0\0\bReg\targs\0\1\0\2\nrange\5\bcmd\tnorm\6G\1\0\1\bcmd\6g\tNorm\1\0\0\1\0\1\bcmd\tnorm\nsetup\17live-command\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/live-command.nvim",
    url = "https://github.com/smjonas/live-command.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  ["mason.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23aaron.config.mason\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cheat.sh"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-cheat.sh",
    url = "https://github.com/RishabhRD/nvim-cheat.sh"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21aaron.config.cmp\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-jdtls",
    url = "https://github.com/mfussenegger/nvim-jdtls"
  },
  ["nvim-keymap-amend"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-keymap-amend",
    url = "https://github.com/anuvyklack/nvim-keymap-amend"
  },
  ["nvim-lightbulb"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14aaron.lsp\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26aaron.config.surround\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27aaron.config.nvim-tree\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28aaron.config.treesitter\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    config = { "\27LJ\2\n?\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0$aaron.config.treesitter-context\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-context"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["octo.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22aaron.config.octo\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/octo.nvim",
    url = "https://github.com/pwntester/octo.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/playground",
    url = "https://github.com/nvim-treesitter/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/popfix",
    url = "https://github.com/RishabhRD/popfix"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["pretty-fold.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29aaron.config.pretty-fold\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/pretty-fold.nvim",
    url = "https://github.com/anuvyklack/pretty-fold.nvim"
  },
  ["query-secretary"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/query-secretary",
    url = "https://github.com/ziontee113/query-secretary"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/quick-scope",
    url = "https://github.com/unblevable/quick-scope"
  },
  ["significant.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/significant.nvim",
    url = "https://github.com/ElPiloto/significant.nvim"
  },
  ["silicon.lua"] = {
    config = { "\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fsilicon\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/silicon.lua",
    url = "https://github.com/narutoxy/silicon.lua"
  },
  ["suda.vim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/suda.vim",
    url = "https://github.com/lambdalisue/suda.vim"
  },
  ["symbols-outline.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  tabular = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/tabular",
    url = "https://github.com/godlygeek/tabular"
  },
  ["targets.vim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/targets.vim",
    url = "https://github.com/wellle/targets.vim"
  },
  ["telekasten.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28aaron.config.telekasten\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/telekasten.nvim",
    url = "https://github.com/renerocksai/telekasten.nvim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nZ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\29aaron.telescope.mappings\26aaron.telescope.setup\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["thesaurus_query.vim"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/thesaurus_query.vim",
    url = "https://github.com/ron89/thesaurus_query.vim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  undotree = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-SpellCheck"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-SpellCheck",
    url = "https://github.com/inkarkat/vim-SpellCheck"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-devicons",
    url = "https://github.com/ryanoasis/vim-devicons"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-grammarous"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-grammarous",
    url = "https://github.com/rhysd/vim-grammarous"
  },
  ["vim-ingo-library"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-ingo-library",
    url = "https://github.com/inkarkat/vim-ingo-library"
  },
  ["vim-man"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-man",
    url = "https://github.com/vim-utils/vim-man"
  },
  ["vim-markdown-toc"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-markdown-toc",
    url = "https://github.com/mzlogin/vim-markdown-toc"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-obsession",
    url = "https://github.com/tpope/vim-obsession"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-rails",
    url = "https://github.com/tpope/vim-rails"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-translator"] = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vim-translator",
    url = "https://github.com/voldikss/vim-translator"
  },
  vimpeccable = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vimpeccable",
    url = "https://github.com/svermeulen/vimpeccable"
  },
  vimspector = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vimspector",
    url = "https://github.com/puremourning/vimspector"
  },
  vimtex = {
    loaded = true,
    path = "/Users/aaronhallaert/.local/share/nvim/site/pack/packer/start/vimtex",
    url = "https://github.com/lervag/vimtex"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: iswap.nvim
time([[Config for iswap.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23aaron.config.iswap\frequire\0", "config", "iswap.nvim")
time([[Config for iswap.nvim]], false)
-- Config for: octo.nvim
time([[Config for octo.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22aaron.config.octo\frequire\0", "config", "octo.nvim")
time([[Config for octo.nvim]], false)
-- Config for: live-command.nvim
time([[Config for live-command.nvim]], true)
try_loadstring("\27LJ\2\nB\0\1\4\0\4\1\n9\1\0\0\t\1\0\0X\1\2'\1\1\0X\2\19\1\0\0'\2\2\0009\3\3\0&\1\3\1L\1\2\0\targs\6@\5\ncountþÿÿÿ\31®\1\1\0\6\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\f\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0003\5\t\0=\5\n\4=\4\v\3=\3\r\2B\0\2\1K\0\1\0\rcommands\1\0\0\bReg\targs\0\1\0\2\nrange\5\bcmd\tnorm\6G\1\0\1\bcmd\6g\tNorm\1\0\0\1\0\1\bcmd\tnorm\nsetup\17live-command\frequire\0", "config", "live-command.nvim")
time([[Config for live-command.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: continuous-testing.nvim
time([[Config for continuous-testing.nvim]], true)
try_loadstring("\27LJ\2\nÉ\4\0\0\6\0\18\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0035\4\a\0=\4\b\3=\3\t\0025\3\f\0005\4\v\0005\5\n\0=\5\6\4=\4\r\0035\4\15\0005\5\14\0=\5\6\4=\4\16\3=\3\17\2B\0\2\1K\0\1\0\21project_override3/Users/aaronhallaert/Developer/nephroflow/link\1\0\0\1\0\2\rtest_cmd5docker exec channel_host bundle exec rspec %file\14test_tool\nrspec=/Users/aaronhallaert/Developer/nephroflow/nephroflow-api\1\0\0\1\0\0\1\0\2\rtest_cmd.run_api.sh -ni -- bundle exec rspec %file\14test_tool\nrspec\20framework_setup\15javascript\1\0\3\17root_pattern\18tsconfig.json\rtest_cmd\26yarn vitest run %file\14test_tool\vvitest\truby\1\0\0\1\0\2\rtest_cmd\28bundle exec rspec %file\14test_tool\nrspec\1\0\1\vnotify\2\nsetup\23continuous-testing\frequire\0", "config", "continuous-testing.nvim")
time([[Config for continuous-testing.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: mason.nvim
time([[Config for mason.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23aaron.config.mason\frequire\0", "config", "mason.nvim")
time([[Config for mason.nvim]], false)
-- Config for: pretty-fold.nvim
time([[Config for pretty-fold.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\29aaron.config.pretty-fold\frequire\0", "config", "pretty-fold.nvim")
time([[Config for pretty-fold.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n<\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: friendly-snippets
time([[Config for friendly-snippets]], true)
try_loadstring("\27LJ\2\n\1\0\0\4\0\a\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0'\2\5\0005\3\6\0B\0\3\1K\0\1\0\1\2\0\0\nrails\truby\20filetype_extend\fluasnip\14lazy_load luasnip.loaders.from_vscode\frequire\0", "config", "friendly-snippets")
time([[Config for friendly-snippets]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21aaron.config.cmp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\nÜ\1\0\0\a\0\v\0\"'\0\0\0006\1\1\0009\1\2\1B\1\1\0029\1\3\1'\2\4\0006\3\1\0009\3\2\3B\3\1\0029\3\5\3'\4\4\0006\5\1\0009\5\2\5B\5\1\0029\5\6\5&\0\5\0006\1\a\0\v\1\0\0X\1\2L\0\2\0X\1\f'\1\b\0006\2\1\0009\2\t\0026\4\a\0B\2\2\2\21\2\2\0'\3\n\0&\1\3\1\18\2\0\0\18\3\1\0&\2\3\2L\2\2\0K\0\1\0\r Plugins\rtbl_keys\v  ï \19packer_plugins\npatch\nminor\6.\nmajor\fversion\bvim\tï§ Ô\14\1\0\n\0000\1o6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\0\0'\4\3\0B\2\2\0029\2\4\2B\0\2\0016\0\5\0006\2\0\0'\3\1\0B\0\3\3\14\0\0\0X\2\12\0^6\2\0\0'\4\6\0B\2\2\0029\3\a\0029\3\b\0035\4\n\0=\4\t\0039\3\a\0029\3\v\0034\4\n\0009\5\f\2'\a\r\0'\b\14\0'\t\15\0B\5\4\2>\5\1\0049\5\f\2'\a\16\0'\b\17\0'\t\18\0B\5\4\2>\5\2\0049\5\f\2'\a\19\0'\b\20\0'\t\21\0B\5\4\2>\5\3\0049\5\f\2'\a\22\0'\b\23\0'\t\24\0B\5\4\2>\5\4\0049\5\f\2'\a\25\0'\b\26\0'\t\27\0B\5\4\2>\5\5\0049\5\f\2'\a\28\0'\b\29\0'\t\30\0B\5\4\2>\5\6\0049\5\f\2'\a\31\0'\b \0'\t!\0B\5\4\2>\5\a\0049\5\f\2'\a\"\0'\b#\0'\t$\0B\5\4\2>\5\b\0049\5\f\2'\a%\0'\b&\0'\t'\0B\5\4\0?\5\0\0=\4\t\0033\3(\0009\4\a\0029\4)\4\18\5\3\0B\5\1\2=\5\t\0049\4\a\0029\4)\0049\4*\4'\5,\0=\5+\0049\4\a\0029\4\b\0049\4*\4'\5-\0=\5+\0049\4\a\0029\4\v\0049\4*\4'\5.\0=\5+\0049\4*\0029\4*\4+\5\2\0=\5/\0049\4\2\0019\6*\2B\4\2\1K\0\1\0K\0\1\0\14noautocmd\16AlphaButton\16AlphaHeader\16AlphaFooter\ahl\topts\vfooter\0\r:qa!<CR>\21ï  Quit Neovim\6q\27:Telescope planets<CR>\19ðª  Planets?\6p\20:PackerSync<CR>\24ïª  Update Plugins\6u$:cd ~/dotfiles | e $MYVIMRC<CR>\23î  Configuration\6c\29:Telescope live_grep<CR>\19ï  Find Text\6tB:lua require('telescope.builtin').oldfiles{only_cwd=true}<CR>\22ï  Recent Files\6r :ene <BAR> startinsert <CR>\18ï  New file\6e\30:Telescope find_files<CR>\19ï¢  Find File\6f\31:Telekasten goto_today<CR>\20ï³  Daily Note\6d\vbutton\fbuttons\1\t\0\0\5\5\1 ââââ   âââââââââââ âââââââ âââ   ââââââââââ   ââââ \1 âââââ  âââââââââââââââââââââââ   âââââââââââ âââââ \1 ââââââ âââââââââ  âââ   ââââââ   âââââââââââââââââ \1 ââââââââââââââââ  âââ   âââââââ ââââââââââââââââââ \1 âââ âââââââââââââââââââââââ âââââââ ââââââ âââ âââ \1 âââ  âââââââââââââ âââââââ   âââââ  ââââââ     âââ \bval\vheader\fsection\27alpha.themes.dashboard\npcall\vconfig\26alpha.themes.startify\nsetup\nalpha\frequire\19À\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\2\0\0\6*\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28aaron.config.bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n)\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\14aaron.lsp\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: git-worktree.nvim
time([[Config for git-worktree.nvim]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\30aaron.config.git-worktree\frequire\0", "config", "git-worktree.nvim")
time([[Config for git-worktree.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n2\0\0\4\0\3\0\0066\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0K\0\1\0\frequire\vnotify\bvim\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26aaron.config.gitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26aaron.config.surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: catppuccin
time([[Config for catppuccin]], true)
try_loadstring("\27LJ\2\nÞ\4\0\0\5\0\17\0003'\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0\18\4\0\0&\3\4\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\n\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\v\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\f\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\r\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\14\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\15\0B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\16\0B\1\2\1K\0\1\0001hi OctoGreyFloat guifg=#2a254c guibg=#3034461hi OctoBlueFloat guifg=#58a6ff guibg=#3034463hi OctoYellowFloat guifg=#d3c846 guibg=#3034463hi OctoPurpleFloat guifg=#6f42c1 guibg=#3034460hi OctoRedFloat guifg=#da3633 guibg=#3034462hi OctoGreenFloat guifg=#238636 guibg=#303446\"hi OctoEditable guibg=#303446\28colorscheme catppuccin-\17nvim_command\bapi\bvim\fflavour\1\0\0\nsetup\15catppuccin\frequire\14macchiato\0", "config", "catppuccin")
time([[Config for catppuccin]], false)
-- Config for: cinnamon.nvim
time([[Config for cinnamon.nvim]], true)
try_loadstring("\27LJ\2\n5\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\26aaron.config.cinnamon\frequire\0", "config", "cinnamon.nvim")
time([[Config for cinnamon.nvim]], false)
-- Config for: guess-indent.nvim
time([[Config for guess-indent.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\17guess-indent\frequire\0", "config", "guess-indent.nvim")
time([[Config for guess-indent.nvim]], false)
-- Config for: telekasten.nvim
time([[Config for telekasten.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28aaron.config.telekasten\frequire\0", "config", "telekasten.nvim")
time([[Config for telekasten.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\28aaron.config.treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\27aaron.config.nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25aaron.config.harpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25aaron.config.luasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: hop.nvim
time([[Config for hop.nvim]], true)
try_loadstring("\27LJ\2\n0\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\21aaron.config.hop\frequire\0", "config", "hop.nvim")
time([[Config for hop.nvim]], false)
-- Config for: nvim-treesitter-context
time([[Config for nvim-treesitter-context]], true)
try_loadstring("\27LJ\2\n?\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0$aaron.config.treesitter-context\frequire\0", "config", "nvim-treesitter-context")
time([[Config for nvim-treesitter-context]], false)
-- Config for: silicon.lua
time([[Config for silicon.lua]], true)
try_loadstring("\27LJ\2\n9\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\fsilicon\frequire\0", "config", "silicon.lua")
time([[Config for silicon.lua]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\n4\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\25aaron.config.comment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nZ\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\29aaron.telescope.mappings\26aaron.telescope.setup\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\"aaron.config.indent_blankline\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'fidget.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
