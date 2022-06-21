call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'dense-analysis/ale'
Plug 'thaerkh/vim-indentguides'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Plug 'SirVer/ultisnips'

call plug#end()


syntax on            
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


syntax on
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_italic=1
colorscheme gruvbox

" Italics
let &t_ZH = "\e[3m"
let &t_ZR = "\e[23m"

" indent-guides

let g:indentguides_spacechar = '▏'
let g:indentguides_tabchar = '▏'

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

  nnoremap <C-a> :CocCommand explorer<CR>

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

" AirLine
  let g:airline_theme = 'gruvbox'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
 

" Telescope

  let mapleader = "\<Space>"

  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
  nmap tc :!

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

" Terminal

  au BufEnter * if &buftype == 'terminal' | :startinsert | endif
  function! OpenTerminal()
    split term://zsh
    resize 15
  endfunction
  nnoremap <C-z> :call OpenTerminal()<CR>
  tnoremap <Esc> <C-\><C-n>
