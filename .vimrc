" .vimrc - Vim configuration file.

" GENERAL SETTINGS: {{{1
" To use VIM settings, out of VI compatible mode.
set nocompatible
" Enable file type detection.
filetype plugin indent on
" Syntax highlighting.
syntax on
" Setting colorscheme
color solarized 
" AirLine
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_theme='bubblegum'
" Add Pathogen
execute pathogen#infect()
"Set mapleader
let mapleader = ","
let g:mapleader = ","

" Other settings.
set   tags=./tags,./../tags,./../../tags,./../../../tags,./../../../../tags,./../../../../../tags,./../../../../../../tags,./../../../../../../../tags,./../../../../../../../../tags,./../../../../../../../../../tags,./../../../../../../../../../../tags,./../../../../../../../../../../../tags,./../../../../../../../../../../../../tags,./../../../../../../../../../../../../../tags,./../../../../../../../../../../../../../../tags
"set   spell
set   autoindent                                "自动缩进
set   autoread
set   autowrite
set   background=dark
set   backspace=indent,eol,start
set   nobackup
set   cindent
set   cinoptions=:0
set   cursorline "设置所在行高亮
set   cursorcolumn "设置所在列高亮
"highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NO
"highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NO
set   completeopt=longest,menuone
set   noexpandtab
set   fileencodings=utf-8,gb2312,gbk,gb18030
set   fileformat=unix
set   foldenable
set   foldmethod=marker
set   guioptions-=T
set   guioptions-=m
set   guioptions-=r
set   guioptions-=l
set   helpheight=10
set   helplang=cn
set   hidden
set   history=100
set   hlsearch
set   ignorecase
set   smartcase
set   incsearch
set   laststatus=2
set   mouse=
set   number
set   pumheight=10
set   ruler
set   scrolloff=65
set   shiftwidth=4
set   showcmd
set   smartindent
set   smartcase
set   tabstop=4
set   termencoding=utf-8
set   textwidth=0
set   whichwrap=h,l
set   wildignore=*.bak,*.o,*.e,*~
set   wildmenu
set   wildmode=list:longest,full
set   nowrap

" AUTO COMMANDS: {{{1
" auto expand tab to blanks
"autocmd FileType c,cpp set expandtab
" Restore the last quit position when open file.
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal g'\"" |
    \ endif

" SHORTCUT SETTINGS: {{{1
" Set mapleader
let mapleader=","
" Space to command mode.
nnoremap <space> :
vnoremap <space> :
" Switching between buffers.
nnoremap <C-h> <C-W>h
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
inoremap <C-h> <Esc><C-W>h
inoremap <C-j> <Esc><C-W>j
inoremap <C-k> <Esc><C-W>k
inoremap <C-l> <Esc><C-W>l
" "cd" to change to open directory.
let OpenDir=system("pwd")
nmap <silent> <leader>cd :exe 'cd ' . OpenDir<cr>:pwd<cr>

" PLUGIN SETTINGS: {{{1
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
nmap <silent> <leader>d :TlistToggle<cr>
nmap <C-h> <C-W>h
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l

let g:Tlist_Auto_Update=1
let g:Tlist_Process_File_Always=1
let g:Tlist_Exit_OnlyWindow=1
let g:Tlist_Show_One_File=1
let g:Tlist_WinWidth=25
let g:Tlist_Enable_Fold_Column=0
let g:Tlist_Auto_Highlight_Tag=1
let g:Tlist_Sort_Type = "name"
""""""""""""""""""""""""""""""
" NERDTree.vim
""""""""""""""""""""""""""""""
let g:NERDTreeWinPos="right"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeQuitOnOpen=1
""""""""""""""""""""""""""""""
" cscope.vim
""""""""""""""""""""""""""""""
if has("cscope")
    set csto=1
    set cst
    set nocsverb
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
" OmniCppComplete.vim
"set nocp 
"filetype plugin on 
let g:OmniCpp_DefaultNamespaces=["std"]
let g:OmniCpp_MayCompleteScope=1
let g:OmniCpp_SelectFirstItem=2

" VimGDB.vim
if has("gdb")
	set asm=0
	let g:vimgdb_debug_file=""
	run macros/gdb_mappings.vim
endif
" LookupFile setting
let g:LookupFile_TagExpr='"./tags.filename"'
let g:LookupFile_MinPatLength=2
let g:LookupFile_PreserveLastPattern=0
let g:LookupFile_PreservePatternHistory=1
let g:LookupFile_AlwaysAcceptFirst=1
let g:LookupFile_AllowNewFiles=0
" Man.vim
source $VIMRUNTIME/ftplugin/man.vim
" snipMate
let g:snips_author="wangguanran"
let g:snips_email="wangguanran@vanzotec.com"
let g:snips_copyright="SicMicro, Inc"
" plugin shortcuts
function! RunShell(Msg, Shell)
	echo a:Msg . '...'
	call system(a:Shell)
	echon 'done'
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>cs :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cg :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cc :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ct :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <leader>ce :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <leader>cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>ci :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <leader>cd :cs find d <C-R>=expand("<cword>")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving & quiting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <silent> <leader>w :w!<cr>
nmap <silent> <leader>q :q<cr>
nmap <silent> <leader>qf :q!<cr>
nmap <silent> <leader>wq :w!<cr>:qall<cr>
nmap <silent> <leader>qq :qall<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast reloading of the .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>s :w<cr>:source ~/.vimrc<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast editing of .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>e :e! ~/.vimrc<cr>

""""""""""""""""""""""""""""""
" Fast saving & loading session
""""""""""""""""""""""""""""""
nmap <silent> <leader>ms :mksession! ~/.vim/last.vim<cr>
nmap <silent> <leader>ss :source ~/.vim/last.vim<cr>
""""""""""""""""""""""""""""""
"Indent
""""""""""""""""""""""""""""""
"Auto indent
set ai

"Smart indet
set si

"C-style indeting
set cindent

set softtabstop=4
set expandtab
set shiftwidth=4
""""""""""""""""""""""""""""""
"Cscope
""""""""""""""""""""""""""""""
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	"set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
	    cs add cscope.out
	" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
	    cs add $CSCOPE_DB
	endif
	set csverb
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" "Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""
" Tag setting
""""""""""""""""""""""""""""""
nmap <cr> <C-]>
nmap <F7> :ts <C-R>=expand("<cword>")<CR><CR>



""""""""""""""""""""""""""""""
" Enable folding, I find it very useful
""""""""""""""""""""""""""""""
"syn region myFold start="{" end="}" transparent fold
"syn sync fromstart
"set foldmethod=syntax
set nofen
set fdl=0

""""""""""""""""""""""""""""""
"Auto complete
""""""""""""""""""""""""""""""
"set complete-=i
set complete =.

""""""""""""""""""""""""""""""" 
"lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2
let g:LookupFile_PreserveLastPattern = 0
let g:LookupFile_PreservePatternHistory = 1
let g:LookupFile_AlwaysAcceptFirst = 1
let g:LookupFile_AllowNewFiles = 0
let g:LookupFile_EnableRemapCmd = 0
if filereadable("./filenametags")
	let g:LookupFile_TagExpr = '"./filenametags"'
endif
nmap <silent> <leader>lt :LUTags<cr>
nmap <silent> <leader>lb :LUBufs<cr>
nmap <silent> <leader>lw :LUWalk<cr>
nmap <silent> <F2> :LUBufs<cr>
nmap <silent> <F3> :exec "LUWalk" expand('%:p:h').'/'<cr>
nmap <silent> <F4> :exec "LUTags" expand("<cword>")<cr>

""""""""""""""""""""""""""""""" 
"Tab setting
""""""""""""""""""""""""""""""
nmap <leader>ta :tab<cr> 
nmap <silent> <leader>te :tabe<cr>
nmap <silent> <leader>ts :tab sp<cr>
nmap <silent> <leader>tc :tabc<cr>
nmap <silent> <leader>to :tabo<cr>
nmap <silent> <leader>tn :tabn<cr>
nmap <silent> <leader>tp :tabp<cr>
nmap <silent> <leader>tr :tabr<cr>

map <silent> <S-Tab> :tabp<cr>
map <silent> <Tab> :tabn<cr>

""""""""""""""""""""""""""""""" 
"quick fix
""""""""""""""""""""""""""""""
autocmd FileType c,cpp nmap <leader><space> :w!<cr>:make<cr>

autocmd BufNewFile,BufRead *.java set formatprg=astyle



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General Autocommands
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Edit current dir
map <F6> :e %:p:h<cr>

nmap <leader>m :marks<cr>

nmap <leader>j :ju<cr>

nmap <leader>/ ^i//<esc>
nmap <leader>. ^<delete><delete><esc>

map <silent> <F8> :%s/	/    /g<cr>
map <silent> <F9> :%s/\s\+$//g<cr>
vmap <silent> <F9> :s/\s\+$//g<cr>

nmap <leader>rg :%s/^\s\+//<cr>:%s/  .*$//<cr>:%s/^/#修正 {{issue_title(/<cr>:%s/$/)}}/<cr>

map aa :s*^\s\+\\|^*\0//*<cr>:noh<cr>
map au :s*\(^\s\+\\|^\)//*\1*<cr>:noh<cr>

map as :%s/\(.*\) \(.*\) \(.*\)/\1 \3 \2/

nmap <leader>lg oprintk("%s\n",__func__);<esc>o<esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  personal settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"used for add code or delete/update code
"for java & C/C++
map <leader>fj o<ESC>0i/* Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i * replace this line<CR><Esc>0a */<CR><Esc>0i// End of Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fj xO<Esc>0i/* Vanzo:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i * replace this line<Esc>gp<Esc>0a */<CR><Esc>0i// End of Vanzo:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for perl
map <leader>fp o<ESC>0i# Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><CR><Esc>0i# End of Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fp xO<Esc>0i# Vanzo:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><ESC>0i=begin<Esc>gp<Esc>0a=end<CR><Esc>0a=cut<CR><CR><Esc>0i# End of Vanzo:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for shell
map <leader>fs o<ESC>0i# Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><CR><Esc>0i# End of Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fs xO<Esc>0i# Vanzo:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><ESC>0i: INGORED UP TO << '--END-COMMENT--'<Esc>gp<Esc>0a--END-COMMENT--<CR><CR><Esc>0i# End of Vanzo:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for makefile
map <leader>fm o<ESC>0i# Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><CR><Esc>0i# End of Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>k
vmap <leader>fm xO<Esc>0i# Vanzo:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0i# TODO: replace this line with your comment<CR><ESC>0iifdef 0<Esc>gp<Esc>0aendif<CR><CR><Esc>0i# End of Vanzo:<Esc>:read !git config --get user.name<CR>kJJ<Del>k
"for xml
map <leader>fx o<ESC>0i<!-- Vanzo:<Esc>:read !git config --get user.name<CR>kJ<Del>$a on:<Esc>:read !date -R <CR><ESC>kJ$o<ESC>0iTODO: replace this line with your comment<CR><Esc>0a--><CR><CR><Esc>0i<!-- End of Vanzo:<Esc>:read !git config --get user.name<CR>$a --><Esc>kJ<Del>k
vmap <leader>fx xO<Esc>0i<!-- Vanzo:<CR><Esc>k:read !git config --get user.name<CR>kJi<Del><Esc>$a on:<CR><Esc>k:read !date -R <CR><ESC>kJ$o<ESC>0iTODO: replace this line with your comment<Esc>gp<Esc>0a--><CR><CR><Esc>0i<!-- End of Vanzo:<Esc>:read !git config --get user.name<CR>$a --><Esc>kJJ<Del>k



nmap  <F2> :TlistToggle<cr>
nmap  <F3> :NERDTreeToggle<cr>
nmap  <F4> :MRU<cr>
nmap  <F5> <Plug>LookupFile<cr>
nmap  <F6> :vimgrep /<C-R>=expand("<cword>")<cr>/ **/*.c **/*.h<cr><C-o>:cw<cr>
nmap  <F9> :call RunShell("Generate tags", "ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .")<cr>
nmap <F10> :call HLUDSync()<cr>
nmap <F11> :call RunShell("Generate filename tags", "~/.vim/shell/genfiletags.sh")<cr>
nmap <F12> :call RunShell("Generate cscope", "cscope -Rb")<cr>:cs add cscope.out<cr>
nmap <leader>sa :cs add cscope.out<cr>

"c: Find functions calling this function
"d: Find functions called by this function
"e: Find this egrep pattern
"f: Find this file
"g: Find this definition
"i: Find files #including this file
"s: Find this C symbol
"t: Find assignments to       c: Find functions calling this function
"d: Find functions called by this function
"e: Find this egrep pattern
"f: Find this file
"g: Find this definition
"i: Find files #including this file
"s: Find this C symbol
"t: Find assignments to
nmap <leader>ss :cs find s <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sg :cs find g <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sc :cs find c <C-R>=expand("<cword>")<cr><cr>
nmap <leader>st :cs find t <C-R>=expand("<cword>")<cr><cr>
nmap <leader>se :cs find e <C-R>=expand("<cword>")<cr><cr>
nmap <leader>sf :cs find f <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>si :cs find i <C-R>=expand("<cfile>")<cr><cr>
nmap <leader>sd :cs find d <C-R>=expand("<cword>")<cr><cr>
nmap <leader>zz <C-w>o
nmap <leader>gs :GetScripts<cr>

set noswapfile
set tags+=/usr/include/tags
map ta :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'wakatime/vim-wakatime'
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
