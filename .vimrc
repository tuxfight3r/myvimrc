" Author: Mohan
" Date: 13/05/2013
" my .vimrc settings file

" Sets how many lines of history VIM has to remember
set history=10000

" Set format options
set formatoptions=tcqr

" Turn on the wild menu
set wildmenu

" Always show current position
set ruler

" *** INDENTING ***
set autoindent

" Use relevant spaces instead of tabs in insert mode
set noexpandtab

" Use smarttab
set smarttab

" Columns TAB counts for normally
set tabstop=4

" Columns vim uses for TAB in insert mode
set softtabstop=2

" Columns text is indented
set shiftwidth=2

" Enable syntax Highlighting
syntax on

" *** COLORS/BACKGROUND ***
set background=dark
" set background=light
" colorscheme kib_darktango
" colorscheme evening
" colorscheme morning
" colorscheme slate
" colorscheme railscasts

" Show matching brackets when text indicator is over them [] {} ()
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

" don't blink the cursor
set guicursor+=i:blinkwait0

" Always show the status line
set laststatus=2

" Format the status line - #commented out for powerline
"set statusline+=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ %m\ \ \ %=%{&ff}\ \ \%y\ \ \ Line:%l,%c\ \ \ Percentage:\ %P

" Display the current mode
set showmode

" Enable/Disable cstyle indenting
" set cindent
set nocindent

" Enable Fold Marker
set foldmethod=marker foldmarker={{{,}}}

" set modeline for modeline magic
set modeline

" Remember info about open buffers on close
set viminfo^=%

" Necessary for vimrc environment settings 
set nocompatible

"Highlight Current line
set cursorline
hi ColorColumn  ctermbg=darkgrey guibg=gray13 cterm=underline term=underline guifg=white
"hi CursorLine   ctermbg=DarkMagenta guibg=gray13 cterm=NONE term=bold guifg=white
hi CursorLine   ctermbg=darkgray guibg=gray13 cterm=NONE term=bold guifg=white

" Enable filetype plugins
filetype plugin indent on
autocmd FileType * setlocal tabstop=4 noexpandtab shiftwidth=2 softtabstop=2
autocmd FileType ruby setlocal tabstop=4 noexpandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

"set foldmethod for xml types
au FileType xml setlocal foldmethod=syntax

" Puppet Settings
au BufRead,BufNewFile *.pp   setfiletype puppet
au BufRead,BufNewFile *.pp   set cinwords=if,else,while,do,for,switch,case,cron,package,file,node

".ru files are Ruby.
au BufRead,BufNewFile *.ru setfiletype ruby

".py files are Python.
au BufRead,BufNewFile *.py setfiletype python

" Markdown gets auto textwidth
au Bufread,BufNewFile *.md set textwidth=79

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" **** KEYBOARD SHORTCUTS ****
" Paste toggle shortcut
set pastetoggle=<F2>

" Display line number
" set nu! - to hide numbers
" set number
nnoremap <F3> :set nonumber!<CR>

" set no wrap long lines of code
set nowrap
nnoremap <F4> :set wrap!<CR>

" set the end of line character
set list
nnoremap <F5> :set nolist!<CR>
set listchars=tab:▸\ ,eol:¬,nbsp:⋅

" Turn on language spell check
set nospell
nnoremap <F6> :setlocal spell! spelllang=en_gb<CR>

" *** Helper Functions ***

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Pathogen
call pathogen#helptags()
call pathogen#infect()

" Syntastic
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*

 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0
 let g:syntastic_enable_signs=1
 let g:syntastic_quiet_messages = {'level': 'warnings'}
 let g:syntastic_puppet_puppetlint_args="disable_autoloader_layout"
 let g:xml_syntax_folding=1

 " NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>

" show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" ModeLine Magic
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ft=%s ts=%d sw=%d tw=%d sts=%d %set :",
        \ &ft, &tabstop, &shiftwidth, &textwidth, &softtabstop, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" enable all Python syntax highlighting features
let python_highlight_all = 1

" Install power line `pip install --user powerline-status`
set rtp+=~/.local/lib/python2.7/site-packages/powerline/bindings/vim
set t_Co=256
let g:airline_powerline_fonts = 1
let g:Powerline_symbols = 'fancy'


"   *** TIPS ***

"MARKERS: 
" ma
" mb
" :
" 'a,'bs/test/foo/g

"BUFFERS / TABS:
" :e  | :tabe filename - open the file to buffer or to tab
" :ls | :tabs  - show opened / available buffers
" :b <n>  -  select the buffer in current pane

" REGISTERS:
" "ayy  -  yank a text into a register. register [a-z]
" "ap   -  paste a text into a register. register [a-z]
" :reg  - show all registers

"COMMAND WINDOW:
" q:  #to open and select the line
" :   #press enter twice to run that command
" ctrl-c # to close the window

"REGEX:
" %s/\(.*\)/Hello \1/g 
" %s/\v^%(foo){1,3}(.+)bar$/\1/ #help :h \v

"SPLIT WINDOWS:
" :split - ctrl-w to switch windows
" :vsplit - ctrl-w to switch windows
" :resize or resize 20 - full or 20lines in the current pane
" :vertical resize or vertical resize 20 - full or 20lines in the current pane
" ctrl + o - max the window
" ctrl + r|R - swap the windows
" ctrl + w w or direction( L|R|U|D) - select the active pane

"NERD TREE:
" m - menu | ctrl-n for toggle
" press key t, i, s - opens files in newtab, hsplit or vsplit

"FOLD TRICK:
" zf#j - # n no of line - zf2j (2 lines)
" v {select lines} + zf - visual select fold
" zf/<word> - till the next occurance of the word from cursor (fold a block of lines))
" zo - open the fold at the cursor
" zc - close the fold at the cursor
" zd - deletes the fold at the cursor
" za - Toggle the fold at the cursor

" RECORD AND REPLAY MACROS:
" change records alternately in a file
" qa      -   record in the register a
" j       -   jump to next line
" 0       -   move to beginning
" cwcase  -   change the word with case
" esc     -   exit out of insert mode
" j       -   jump to next line
" 0       -   move to beginning
" q       -   stop the recording
" @a or 10@a - replay the macro n no of times

" MODELINE MAGIC:
" \ml     -  Insert the modeline magic
"
" WINDOWS SWAP:
" \yw     - yank Window
" \pw     - paste window

" vim: set ft=vim ts=4 sw=2 tw=78 sts=2 noet :
