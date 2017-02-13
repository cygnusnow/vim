"set nocompatible " disable vi compatibility.
set history=256 " Number of things to remember in history.
set autowrite " Writes on make/shell commands
set autoread
"set timeoutlen=250 " Time to wait after ESC default causes an annoying delay
set clipboard+=unnamed " Yanks go on clipboard instead.
set pastetoggle=<F10> " toggle between paste and normal: for 'safer' pasting from keyboard
set tags=./tags;$HOME " walk directory tree upto $HOME looking for tags

" Modeline
set modeline
set modelines=5 " default numbers of lines to read for modeline instructions

" Backup
set nowritebackup
set nobackup

" Buffers
set hidden " The current buffer can be put to the background without writing to disk
" Match and search
set hlsearch " highlight search
set ignorecase " Do case in sensitive matching with
set smartcase " be sensitive when there's a capital letter
set incsearch

set nowrap
set textwidth=0 " Don't wrap lines by default
set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

set backspace=indent,eol,start " more powerful backspacing

set tabstop=2 " Set the default tabstop
set softtabstop=2
set shiftwidth=2 " Set the default shift width for indents
set expandtab " Make tabs into spaces (set by tabstop)
set smarttab " Smarter tab levels

set autoindent
set cindent
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case


" Color
if has('gui_running')
  colorscheme desert
endif
syntax on " enable syntax
filetype plugin indent on " Automatically detect file types.
"

" Visual
set number " Line numbers on
set showmatch " Show matching brackets.
set matchtime=5 " Bracket blinking.
set novisualbell " No blinking
set noerrorbells " No noise.
set laststatus=2 " Always show status line.
set vb t_vb= " disable any beeps or flashes on error
set ruler " Show ruler
set showcmd " Display an incomplete command in the lower right corner of the Vim window
set shortmess=atI " Shortens messages

set nolist " Display unprintable characters f12 - switches

set foldenable " Turn on folding
set foldmethod=marker " Fold on the marker
" Don't autofold anything, but I can still fold manually
"set foldlevel=100 
set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds

set splitbelow
set splitright

" Command and Auto commands

"Auto commands
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru} set ft=ruby
au BufRead,BufNewFile {*.md,*.mkd,*.markdown} set ft=markdown
au BufRead,BufNewFile {COMMIT_EDITMSG} set ft=gitcommit


" Key mappings 
nnoremap <silent> <F4> :Tlist<CR>
nnoremap <F5> :!find . -iname '*.c' -o -iname '*.cpp' -o -iname '*.h' -o -iname '*.hpp' > cscope.files<CR>
                        \ :!cscope -bk -i cscope.files -f cscope.out<CR>
                                    \ :cs reset<CR>

nnoremap <F6> :!cscope -bkq -i cscope.files<CR>
imap <Leader>time <C-R>=strftime("* %a %b %d %G Cygnus.Yang <Cygnus.Yang@radisys.com>")<CR>
imap <Leader>dns <C-R> #if !defined (CYGNUS_MODIFY)<CR>
      \#endif /* CYGNUS_MODIFY */
imap <Leader>ds <C-R> #if defined (CYGNUS_MODIFY)
imap <Leader>de <C-R> #endif /* CYGNUS_MODIFY  */

nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

"taglist
 "   let Tlist_Show_One_File = 1
 "   let Tlist_Exit_OnlyWindow = 1
 "   let Tlist_Use_Right_Window = 1
 "   let Tlist_GainFocus_On_ToggleOpen = 1
 "   let Tlist_Ctags_Cmd='/usr/bin/ctags'
 "   nnoremap <leader>tl : Tlist<CR>

" Plugins
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Mark'
"Plugin 'minibufexpl.vim'
"let g:miniBufExplSplitBelow=0
"let g:miniBufExplMapWindowNavVim = 1 
"let g:miniBufExplMapWindowNavArrows = 1 
"let g:miniBufExplMapCTabSwitchBufs = 1 
"let g:miniBufExplModSelTarget = 1
Plugin 'vim-scripts/DrawIt'
Plugin 'TabBar'
let g:Tb_MaxSize=3
Plugin 'vim-scripts/bash-support.vim'
Plugin 'taglist-plus'
Plugin 'ccase.vim'
Plugin 'ctags.vim'
nmap tags :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR> 
Plugin 'autoload_cscope.vim'
Plugin 'cscope_macros.vim'
"set cscopequickfix=c-,d-,e-,g-,i-,s-,t-
Plugin 'winmanager'
let g:winManagerWidth=40
let g:winManagerWindowLayout = 'FileExplorer|TagList'
nmap wm :WMToggle<cr>
Plugin 'scrooloose/nerdtree'
"Plugin 'SuperTab'
"Plugin 'clang-complete'
Plugin 'showmarks'
Plugin 'altercation/vim-colors-solarized'
Plugin 'rosenfeld/conque-term'
let g:ConqueTerm_TERM ='xterm'
nmap <Leader>sh :ConqueTerm bash<CR>
nmap <Leader>shs :ConqueTermSplit bash<CR>
nmap <Leader>shv :ConqueTermVSplit bash<CR>
nmap <Leader>sht :ConqueTermTab bash<CR>
Plugin 'DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="Cygnus.Yang@radisys.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "Radisys\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
Plugin 'OmniCppComplete'
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1 
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1 
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
set completeopt=menuone,menu,longest
highlight Pmenu    guibg=darkgrey  guifg=black 
highlight PmenuSel guibg=lightgrey guifg=black
Plugin 'code_complete'
"Plugin 'AutoComplPop'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

