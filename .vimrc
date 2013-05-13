" Sets how many lines of history VIM has to remember
set history=700

" Set format options
set formatoptions=tcqr

" Enable filetype plugins
filetype plugin on
filetype plugin on

" Turn on the wild menu
set wildmenu

" Always show current position
set ruler

" Display line number
" set nu! - to hide numbers
set number
nnoremap <F3> :set nonumber!<CR>

" *** INDENTING ***
set autoindent
set smartindent

" set no wrap long lines of code
set nowrap

" Use relevant spaces instead of tabs in insert mode
set noexpandtab

" Columns TAB counts for normally
set tabstop=4

" Columns vim uses for TAB in insert mode
set softtabstop=2

" Columns text is indented
set shiftwidth=2

" Paste toggle shortcut
set pastetoggle=<F2>

" Enable syntax Highlighting
syntax on

" *** COLORS/BACKGROUND ***
set background=dark
colorscheme kib_darktango

" Show matching brackets when text indicator is over them
set showmatch

" For regular expressions turn magic on
set magic

" Highlight|disable search results
" set hlsearch
set nohls

" Makes search act like search in modern browsers
set incsearch

"Always show current position
set ruler

"Highlight Current line
set cursorline

" Always show the status line
set laststatus=2

" Format the status line
set statusline+=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l,%c\ \ \ Percentage:\ %P

" Display the current mode
set showmode

" Enable/Disable cstyle indenting
" set cindent
set nocindent

" set modeline and store it local for all files
set modeline
au FileType rb,pl,sh setlocal tabstop=4 noexpandtab shiftwidth=2 softtabstop=2

" Puppet Settings
au BufRead,BufNewFile *.pp   setfiletype puppet
au BufRead,BufNewFile *.pp   set cinwords=if,else,while,do,for,switch,case,cron,package,file,node

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" *** Helper Functions ***

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction
