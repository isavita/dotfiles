set number
set relativenumber
set expandtab
set tabstop=2 softtabstop=2 shiftwidth=2
set colorcolumn=120
set foldcolumn=1
set autoindent
set showmatch
set nocompatible
syntax on

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" Change the mapleader from \ to ,
let mapleader = "\<Space>"
" Access colors present in 256 colorspace
let base16colorspace = 256

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/syntastic'

Plug 'townk/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'vim-ruby/vim-ruby'
Plug 'thoughtbot/vim-rspec'

call plug#end()

colorscheme base16-gruvbox-light-hard

" NERDTree settings
let NERDTreeMinimalUI = 1
let NERDTreeAutoDeleteBuffer = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <C-n> :NERDTreeToggle<CR>

" Close html tags
let g:closetag_xhtml_filenames = '*.html,*.jsx,*.js'

" Paste mode settings
set pastetoggle=<F2>

" Syntactic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rspec settings
let g:rspec_runner = "os_x_iterm2"
let g:rspec_command = "!bundle exec rspec {spec}"
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Map : to ;
nnoremap ; :

nnoremap j gj
nnoremap k gk

"kWindow navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clearing highlighted searches
nmap <silent> ,/ :nohlsearch<CR>
" Strip trailing whitespaces
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Sudo privileges with w!!
cmap w!! w !sudo tee % >/dev/null
