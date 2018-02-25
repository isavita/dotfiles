set relativenumber
set expandtab
set softtabstop=2 shiftwidth=2
set showmatch
syntax on

" Change the mapleader from \ to ,
let mapleader = ","
" Access colors present in 256 colorspace
let base16colorspace = 256

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree'
Plug 'wincent/Command-T'
Plug 'scrooloose/syntastic'
Plug 'valloric/youcompleteme'
Plug 'townk/vim-autoclose'
Plug 'alvan/vim-closetag'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'

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

" Window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Clearing highlighted searches
nmap <silent> ,/ :nohlsearch<CR>
" Strip trailing whitespaces
nnoremap <Leader>W :%s/\s\+$//<cr>:let @/=''<CR>
