call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dense-analysis/ale'
Plug 'thaerkh/vim-indentguides'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'luochen1990/rainbow'
Plug 'majutsushi/tagbar'
" Plug 'SirVer/ultisnips'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
Plug 'APZelos/blamer.nvim'

Plug 'nvim-treesitter/nvim-treesitter'
Plug 'preservim/nerdcommenter'
Plug 'akinsho/toggleterm.nvim', { 'tag': 'v1.*' }


call plug#end()


syntax on

set background=dark
set encoding=utf-8
set termguicolors
set number
set relativenumber               
set tabstop=4
set cursorline       
set softtabstop=4    
set shiftwidth=4     
set expandtab        
set smarttab         
set smartindent      
set hidden           
set incsearch        
set ignorecase       
set smartcase        
set scrolloff=8         
set cmdheight=2      
set updatetime=100   
set encoding=utf-8   
set nobackup         
set nowritebackup    
set splitright       
set splitbelow       
set autoread         
set mouse=a
set colorcolumn=150
set t_Co=256          


filetype on
filetype plugin on
filetype indent on 


let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
colorscheme gruvbox

" highlight Normal guibg=NONE ctermbg=NONE
" highlight EndOfBuffer guibg=NONE ctermbg=NONE

" Italics

let &t_ZH="\e[3m"
let &t_ZR="\e[23m"


" toggleterm

lua << END
require("toggleterm").setup({
	size = 20,
	open_mapping = [[<C-z>]],
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = 2,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})
END

" lualine

lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'gruvbox_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
END


" bufferline

lua << END
  require("bufferline").setup{}
END


" vim-indentguides

  let g:indentguides_spacechar = '┆'
  let g:indentguides_tabchar = '┆'

"ale

let g:ale_linters = {
\   'python': ['pyright'],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1

  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_sign_error = '✘'
  let g:ale_sign_warning = '⚠'


" COC

  let g:coc_global_extensions = []

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> rn <Plug>(coc-rename)
  nnoremap <silent> K :call <SID>show_documentation()<CR>
  inoremap <silent><expr> <c-space> coc#refresh()

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction
 

 " coc-explorer

   nnoremap <C-a> :CocCommand explorer<CR>


" Telescope

  let mapleader = "\<Space>"

  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fc <cmd>Telescope git_commits<cr>
  nnoremap <F1>       <cmd>Telescope treesitter<cr>


  " Rainbow Brackets

  let g:rainbow_active = 1

  let g:rainbow_conf = {
  \  'operators': '_,\|+\|-\|*\|\/\|===\|!==_',
  \  'guis': ['bold']
  \}


 " Tagbar

  nmap <F8> :TagbarToggle<CR>


" blamer

  let g:blamer_enabled = 1
  let g:blamer_delay = 500
  let g:blamer_show_in_visual_modes = 0
  let g:blamer_show_in_insert_modes = 0


" GitGutter

  highlight clear SignColumn
  highlight GitGutterAdd    guibg=NONE
  highlight GitGutterChange guibg=NONE
  highlight GitGutterDelete guibg=NONE


" NERD Commenter

  noremap <Leader>cc 


" Remaps
  
  map <C-Left> <C-w>h
  map <C-Down> <C-w>j
  map <C-Up> <C-w>k
  map <C-Right> <C-w>l
  nmap op o<Esc>k
  nmap oi O<Esc>j
  nmap oo A<CR>
  nmap te :tabe<CR>
  nmap tc :tabclose<CR>
  nmap ty :bn<CR>
  nmap tr :bp<CR>
  nmap td :bd<CR>
  nmap th :split<CR>
  nmap tv :vsplit<CR>
  nmap tt :q<CR>
  

  inoremap <C-s> <esc>:w<cr>
  nnoremap <C-q> :exit<cr>
  nnoremap <M-Right>     :vertical resize -2<CR>
  nnoremap <M-Left>      :vertical resize +2<CR>
  


command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" autocmd
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction

autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()