syntax on
autocmd FileType yaml setlocal shiftwidth=2
autocmd BufEnter * set mouse=
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent
filetype indent plugin on
set number
nmap <C-i> :set invnumber<CR>

" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
map <C-a> <Home>
map <C-e> <End>

call plug#begin()

Plug 'https://github.com/hashivim/vim-terraform.git'
Plug 'https://github.com/terryma/vim-smooth-scroll.git'
Plug 'https://github.com/f-person/git-blame.nvim.git'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go'
Plug 'gruvbox-community/gruvbox'

call plug#end()

"colorscheme gruvbox

"set background=dark

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
let g:terraform_fold_sections = 0
let g:terraform_align = 1

"colorise even indents
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3

"colorise odd indents
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"start nerdtree with vim startup
"autocmd VimEnter * NERDTree | wincmd p

highlight CursorLine guibg=#303030
highlight Cursor guibg=#626262
set cursorline
set cursorcolumn

set foldmethod=syntax
set foldnestmax=1

highlight CursorColumn guibg=lightblue ctermbg=lightgray
let NERDTreeShowHidden = 1
let NERDTreeQuitOnOpen = 1
nmap <C-t> :NERDTreeToggle<CR>
set backspace=indent,eol,start
au VimLeave * :!clear

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
