"Before editing consult vim-sensible as the
"intended edit might already be implemented there
"also this .vimrc expects vim-plug installed

"vim-plug begin
call plug#begin('~/.vim/plugged')

"Plugins go here:

" comments gcc - line
"          gc  - target of motion (or selection)
Plug 'tpope/vim-commentary'

"Set of essential sensible vim settings
Plug 'tpope/vim-sensible'

"Plugin for surrounding text objects
"ysiw) for surrounding inner word with parentheses
Plug 'tpope/vim-surround'

"tpope's status line
Plug 'tpope/vim-flagship'

"tpope's git plugin (integrates with the status line)
Plug 'tpope/vim-fugitive'

"repeat functionality for tpope's plugins
Plug 'tpope/vim-repeat'

" vim vinegar - built in file explorer netrw extension
" press - in any buffer to jump to its directory browser
" press gh to toggle hidden files
" press . to populate filename under the cursor to the end of :command line
" press y. to yank absolute path to the file
" press ~ to go home
" pres CTRL^ to go back to the buffer
Plug 'tpope/vim-vinegar'

" gr{motion} to replace {motion} with text in register
Plug 'vim-scripts/replacewithregister'

Plug 'ctrlpvim/ctrlp.vim'

"solarized color theme
Plug 'altercation/vim-colors-solarized'

"solarized for neovim
if has('nvim')
    Plug 'craftzdog/solarized-osaka.nvim'
endif

"highlighting for ARM asm
Plug 'ARM9/arm-syntax-vim'

call plug#end()
"end of vim-plug

set background=dark
colorscheme solarized
if has('nvim')
    colorscheme solarized-osaka
endif

" Set utf-8 as standard encoding
set encoding=utf-8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" set listchars for :set list
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"Spliting will open new window on the right or below from active window
set splitright splitbelow

"split navigations w/o <C-W>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split navigations w/o <C-W> for terminal mode
tnoremap <C-J> <C-W><C-J>
tnoremap <C-K> <C-W><C-K>
tnoremap <C-L> <C-W><C-L>
tnoremap <C-H> <C-W><C-H>

"map escape to turn off highlights the second line is to prevent a bug
nnoremap <silent><esc> :noh <CR>
nnoremap <esc>^[ <esc>^[

"allow clipboard shared with other apps
set clipboard=unnamed

"Set vertiacal guide on 80 characters
"set colorcolumn=80

"search case sensitive only if search pattern contains upper case characters
set ignorecase
set smartcase

"Showing line number
set number

"Showing relative numbers
set relativenumber

"indents by rules given by cinkeys and cinoptions
set cindent

set shiftwidth=4 "default indent size
set cinoptions+={.5s "indent already inner braces
set cinoptions+=^-.5s "indent interior of top level functions only 0.5 shiftwidth
set cinoptions+=c2 "indent multi-line comments by 2
set cinoptions+=(0 "when in function, the arguments on new line are alligned to opening brace
set cinoptions+=Ws,k2s "when the line is too long, this may be handy

autocmd FileType javascript setlocal shiftwidth=2

"folding
set foldmethod=syntax "folds given by syntax
set foldnestmax=1 "only top level entities
set nofoldenable "so the file opens without folding on
autocmd FileType python setlocal foldmethod=indent
autocmd FileType python setlocal foldnestmax=2

"show extra whitespace:
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match ExtraWhitespace /\s\+$/
highlight ExtraWhitespace ctermbg=red guibg=red

"setup ARM asm highlighting
au BufNewFile,BufRead *.s,*.S set filetype=arm " arm = armv6/7

"support for mouse
set mouse=a

" How many tenths of a second to blink when matching brackets
set matchtime=2

" Show matching brackets when text indicator is over them
set showmatch

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Use spaces instead of tabs
set expandtab

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

"Show typed command
set showcmd

"No modelines (modelines are special lines for vim in at the beginning of a file)
set nomodeline

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
endif

