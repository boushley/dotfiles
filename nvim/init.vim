" No backwards compatibility with vi
" KEEP THIS FIRST, IT HAS SIDE EFFECTS ON OTHER SETTINGS
set nocompatible 
filetype off " Turn off filetype settings while loading neobundle plugins

" set the runtime path to include neobundle and initialize
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))

" let neobundle manage neobundle, required
NeoBundleFetch 'Shouogo/neobundle.vim'

NeoBundle 'tpope/vim-characterize'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tpope/vim-sleuth'
NeoBundle 'fatih/vim-go'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'Lokaltog/vim-powerline'
NeoBundle 'gcmt/wildfire.vim'
NeoBundle 'ap/vim-css-color'
NeoBundle 'digitaltoad/vim-jade'
NeoBundle 'groenewege/vim-less'
NeoBundle 'fatih/vim-go'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'vim-scripts/ZoomWin'
NeoBundle 'othree/yajs.vim'
NeoBundle 'docker/docker', {'rtp': '/contrib/syntax/vim/'}
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'HerringtonDarkholme/yats.vim'
NeoBundle 'Quramy/tsuquyomi'
NeoBundle 'Shougo/unite.vim'

call neobundle#end()
filetype plugin indent on " automatically figure out what kind of file we're working with

" Setup some keybindings
let mapleader = "," " Setup leader key

NeoBundleCheck

"set relativenumber " Use relative line numbers
set number " Except make the current line have it's number

if has("gui_gtk2")
    set guifont=Ubuntu\ Mono\ 12 " Set the font
elseif has("gui_macvim")
    set guifont=Monaco:h14
elseif has("gui_win32")
    set guifont=Consolas:h11
end
" Setup Some of the look
let g:solarized_termtrans=1
set t_Co=256
set title " Makes titlestring change the window title.
set noicon " See the help.
colorscheme solarized
set background=dark
syntax enable
set guioptions-=T " Remove the gui toolbar

" Setup Indentation
set autoindent " When adding a new line indent it like the current line or use smartindent
set smartindent " For c like syntax do indenting
set foldmethod=indent " turn on folding
set tabstop=4
set softtabstop=4
set shiftwidth=4

set number " Turn on line numbering by default
set cursorline " Turn on current line highlighting

" Change the tabstop size
nmap <leader>s :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap <leader>S :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap <leader>m :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap <leader>M :set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>

" Copy the visually selected text
vnorem // y/<c-r>"<cr>

" Setup Per Directory vimrc files
set exrc " enable vimrc files per directory
set secure " Disable unsafe commands in per directory .vimrc files

" When dealing with marks ` is more useful than ', so make the better one easier to reach
nnoremap ' `
nnoremap ` '

" location-list navigation
nnoremap <leader>n :lnext<CR>
nnoremap <leader>p :lprev<CR>

" Setup vim-task bindings
inoremap <silent> <buffer> <C-D-CR> <ESC>:call Toggle_task_status()<CR>i
noremap <silent> <buffer> <C-D-CR> :call Toggle_task_status()<CR>i

" Don't need to turn off backups, just don't put them all over the filesystem
set backupdir=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//,C:\tmp\\
set directory=~/.vim-tmp//,~/.tmp//,~/tmp//,/var/tmp//,/tmp//,C:\tmp\\

" Save undo history across sessions, only works in GUI
if has('gui_running')
  set undodir=~/.vim/backups
  set undofile
endif


" Searching Options
set hlsearch "set noh " Highlight matches when searching.
set incsearch "set noincsearch " Start searching right away.
set ignorecase " Ignore the case in search patterns.
set smartcase " If the first letter if capitalized search is case sensitive.

" Scroll the viewport a bit faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" Turn on persistent undo
if exists("+undofile")
    set undodir=~/.vim/undo
    set undofile
    set undolevels=8000
    set undoreload=30000
endif

" Control P ctrlp Customization
nnoremap <silent> <Leader>f :CtrlP<CR>
nnoremap <silent> <Leader>b :CtrlPBuffer<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.exe
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files . -co --exclude-standard | grep -v web\/htdocs'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

" Take care of some bells
set noerrorbells " No more beep! ;-)
set visualbell t_vb= " Terminal's visual bell - turned off to make Vim quiet!

" The following always keep a bit of context on the screen around the cursor.
set scrolljump=1 " When scrolling this is how many lines to jump.
set scrolloff=3 " This is how many lines to keep above or below cursor.
set sidescroll=1 " Same as scrolljump but for the horizontal
set sidescrolloff=6 " Same as above but for horizontal.
" sidescrolloff test garbage: asldkfj;alskjdfffffIfffffffffffffffffffffffffffffffffffffffffffffffffffal;skdjf;lkasjdfl;kjal;skdfffffffffffffalksdjf;lkasjdffffffffffffffffl;aksjdf

set hidden " Handle buffers in a more expected manner
set history=1000 " Lines of command line history to keep.
set wildmenu " Way cool completion in command line mode
set wildmode=list:longest " Make command line completion function like the shell, prompting completion
set completeopt=menuone,longest " Make insert mode completion only insert the longest substring
set backspace=indent,eol,start " Makes backspace function normally in insert mode
set helpheight=0 " Zero disables helpheight (see the help section).
set textwidth=120 " Max width of text being entered.
set laststatus=2 " Show status line always!
set lazyredraw " Do not update screen while executing macros.
set ruler " Show cursor position?  Yep!
set shell=zsh

set formatoptions=cqrow " Options for the "text format" command ("gq")
" c - format comments
" q - format comments with gq
" r - insert current comment leader when hitting <Enter>
" t - format text (should be removed for code)
" o - similar to r except only comment leader"+
" a - reflow text automatically"+
" n - recognize numbered lists"+
" w - trailing whitespace means paragraph continues
" 2 - use second line of paragraph for formatting

" when list is on show whitespace characters like follows
set listchars=tab:>-,trail:·,extends:>,precedes:<
set list
" set invlist " <--These toggles showing these characters

set shortmess=aostITO " Kind of messages to show. Abbreviate them all!
set showcmd " Show current uncompleted command? Absolutely!
set showmatch " Briefly jump to the matching brace when typed
set showmode " Show the current mode at the bottom.

" Ignore filename with any of these suffixes (for autocompletion)
set suffixes=.aux,.bak,.dvi,.idx,.log,.ps,.pdf,.swp,.tar,.o,.class

set ttyfast " Are we using a fast terminal? setting depends Vim usage...
"set nottybuiltin " search external termcaps first
"set ttyscroll=0 " Turn off scrolling (faster)!
set nostartofline " Do not jump to first character with page commands. Keep the cursor in the current column.
set splitbelow " When splitting a window, put the new window below.
set viminfo=c,%,'50,"100,:100,h,n.viminfo " Info to store in the viminfo file for next session.

" ===============================================================
" Wrap commands
" ===============================================================
set whichwrap=b,s,<,>,h,l,[,],~ " These keys follow the line wrap.
set virtualedit= " virtualedit=all lets cursor move anywhere.
"wrapmargin=1 " How far from the right window border to start wraping
set nowrap " I don't want vim to wrap lines

" ===============================================================
" Window commands
" ===============================================================
" These allow us to switch more easily between windows
" <C-W>_ Switches windows (end for maximizing)
map <C-J> <C-W>j
" <C-W>_ Switches windows (end for maximizing)
map <C-K> <C-W>k
" <C-W>_ Switches windows (end for maximizing)
map <C-H> <C-W>h
" <C-W>_ Switches windows (end for maximizing)
map <C-L> <C-W>l
" Maximizes current window
map _ <C-W>_
" The following have problems right now. The cursor moves with the operation.
" makes window larger
map + <C-W>+
" makes window smaller
map - <C-W>-

" tab navigation like firefox
nmap th :tabprevious<CR>
nmap tl :tabnext<CR>
map th :tabprevious<CR>
map tl :tabnext<CR>

" ===================================================================
" MAPpings
" ===================================================================

" Reload this file
if has("unix")
	nmap <F12> :source ~/.vimrc<CR>
elseif has("win32")
	nmap <F12> :source ~/_vimrc<CR>
endif

" Paste at current tab level (doesn't work that great)
"nmap p ]p
"
" Re-tab whole file
nmap <F6> mzgg=G`z

" toggle line numbering
nmap <C-N> :set invnumber<CR>

" Don't use Ex mode, use Q for formatting
noremap Q gq

" 'o' in insert mode
inoremap <C-CR> <C-O>o

" For unix I've found the + register to work best, for windows *.
" vim to system clipboard
map <F9> :let @+=@"<CR>

" system clipboard to vim
map <F10> :let @"=@+<CR>

" NERDTree toggle
map <F2> :NERDTreeToggle<CR>

" Supertab Settings
let g:SuperTabDefaultCompletionType = "<c-p>"
function! ToggleDefaultSupertabType()
    if g:SuperTabDefaultCompletionType == "<c-x><c-u>"
        :call SuperTabSetCompletionType("<c-p>")
        :call SuperTabSetDefaultCompletionType("<c-p>")
        let g:SuperTabDefaultCompletionType = "<c-p>"
        echo "Set SuperTab to c-p"
    else
        :call SuperTabSetCompletionType("<c-x><c-u>")
        :call SuperTabSetDefaultCompletionType("<c-x><c-u>")
        let g:SuperTabDefaultCompletionType = "<c-x><c-u>"
        echo "Set SuperTab to c-x c-u"
    endif
endfunction

" ';;' inserts a ';' at the end of the line (';' is a problem with 'for(;;)')
inoremap ;; <Esc>A;

" The following avoid jumping over wrapped lines
imap <Down> <C-O>gj
nmap j gj
imap <Up> <C-O>gk
nmap k gk

" ===================================================================
" Functions
" ===================================================================

" paranthesis matchers
inoremap ( (<C-V>)<Left>
inoremap ) <C-R>=ClosePair(')')<CR>
inoremap [ [<C-V>]<Left>
inoremap ] <C-R>=ClosePair(']')<CR>
inoremap { {<C-V>}<Left>
inoremap } <C-R>=ClosePair('}')<CR>
function! ClosePair(char)
	if(getline('.')[col('.')-1] == a:char)
		return "\<Right>"
	else
		return a:char
	endif
endf

" Recognize *.es6 files as js files
autocmd BufRead,BufNewFile *.es6 set filetype=javascript

" pretty-print JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim
" json_reformat is part of yajl: http://lloyd.github.com/yajl/
map <Leader>j !python -m json.tool<CR>

" ex command for toggling hex mode - define mapping if desired
command -bar Hexmode call ToggleHex()

" helper function to toggle hex mode
function ToggleHex()
  " hex mode should be considered a read-only operation
  " save values for modified and read-only for restoration later,
  " and clear the read-only flag for now
  let l:modified=&mod
  let l:oldreadonly=&readonly
  let &readonly=0
  let l:oldmodifiable=&modifiable
  let &modifiable=1
  if !exists("b:editHex") || !b:editHex
    " save old options
    let b:oldft=&ft
    let b:oldbin=&bin
    " set new options
    setlocal binary " make sure it overrides any textwidth, etc.
    let &ft="xxd"
    " set status
    let b:editHex=1
    " switch to hex editor
    %!xxd
  else
    " restore old options
    let &ft=b:oldft
    if !b:oldbin
      setlocal nobinary
    endif
    " set status
    let b:editHex=0
    " return to normal editing
    %!xxd -r
  endif
  " restore values for modified and read only state
  let &mod=l:modified
  let &readonly=l:oldreadonly
  let &modifiable=l:oldmodifiable
endfunction

" for tmux to automatically set paste and nopaste mode at the time pasting (as
" happens in VIM UI)
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction
let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()


" =================================================================== 
" AutoCommands
" ===================================================================

autocmd FileType text set formatoptions+=t | set textwidth=120

" autocmd BufEnter * let &titlestring = hostname() . " - " . expand ("%:~:p")
autocmd BufEnter * let &titlestring = expand ("%:t")

" Jump to last cursor position
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal g`\"" |
			\ endif

function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
