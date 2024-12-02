
set nocompatible
filetype off

" From: https://github.com/neoclide/coc.nvim?tab=readme-ov-file#example-vim-configuration
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649 (in coc.nvim)
set nobackup
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" "" Vundle
" " set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" " set rtp+=~/.config/nvim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'VundleVim/Vundle.vim'
" " Plugin 'christoomey/vim-tmux-navigator'
" " Plugin 'vim-airline/vim-airline'
" " Plugin 'vim-airline/vim-airline-themes'
" " Plugin 'keith/tmux.vim' " Syntax highlighting for .tmux.conf
" " Plugin 'easymotion/vim-easymotion'
" " Plugin 'airblade/vim-gitgutter'
" " Plugin 'terryma/vim-multiple-cursors'
" " Plugin 'isRuslan/vim-es6'
" Plugin 'leafgarland/typescript-vim' " Syntax highlighting for typescript
" " Plugin 'quramy/tsuquyomi' " typescript extra features
" " " Plugin 'scrooloose/nerdtree'
" " Plugin 'tpope/vim-surround' " dopee
" " Plugin 'leafgarland/typescript-vim' " typescript syntax
" call vundle#end()

" VimPlug (new)
" Apparently Vundle hasn't been mantained and VimPlug is the way to go now
" I should delete vundle: rm -rf ~/.vim/bundle
call plug#begin('~/.vim/plugged')
  Plug 'flazz/vim-colorschemes'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'airblade/vim-gitgutter'
  " Plug 'dense-analysis/ale'
  " Provided through coc now
  " Plug 'leafgarland/typescript-vim' " Syntax highlighting for typescript

  " Language-server features
  " Note: can install more language servers here: https://github.com/neoclide/coc.nvim/wiki/Language-servers
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Give more space for displaying messages.
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
map <F2> <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}



" "" VimPlug (for some plugins that need compiling)
" " Autoinstall if not present
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif
" " Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
" call plug#begin('~/.vim/plugged')
" " Make sure you use single quotes
" Plug 'Shougo/vimproc.vim', {'do' : 'make'}
" Plug 'nightsense/vim-crunchbang'
" " Plug 'tpope/vim-abolish'
" call plug#end()

filetype plugin indent on

" http://www.johnhawthorn.com/2012/09/vi-escape-delays/
" seems to be inserting a "g" at the beggining of the file for some reason
" set timeoutlen=1000 ttimeoutlen=0 " reduces the annoying timeout from pressing esc

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Config
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" From Plugin 'flazz/vim-colorschemes'
colorscheme molokai

" From Plugin 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store'

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" ""
" " let NERDTreeQuitOnOpen=1

" " :command! Explore NERDTree
" "" Airline
" " so airline powerline symbols work
" let g:airline_powerline_fonts=1
" let g:airline_theme='base16'

" "" CtrlP
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_working_path_mode = 'ra'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip,node_modules
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '.(git|hg|svn)$|_build$',
"   \ }
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" "" Easymotion
" " easymotion setup
" let g:Easymotion_smartcase = 1
" map / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=500                    " Remember 700 lines of history
set lazyredraw                     " redraw only when we need to (faster performance)
set autoread                       " Autoread files when changed externally
set encoding=utf-8                 " Set utf8 as standard encoding
set ffs=unix,mac,dos               " Use Unix as the standard file type

set backspace=eol,start,indent     " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l             " "
set clipboard=unnamed              " use system clipboard

" inoremap jj <ESC>                  " Remap jj to escape in insert mode.

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Make it so deleting doesnt store to the buffer
noremap <leader>d "_d
noremap dd "_dd

"Automatically cd into the directory that the file is in:
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Wildmenu
set wildmenu                        " Turn on the WiLd menu
set wildignore=*.o,*~,*.pyc         " Ignore compiled files
set wildmode=longest:full,full      " complete to the longest common string first

" Folding
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
set foldmethod=indent   " fold based on indent level

" nnoremap <space> za " space open/closes folds

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI BRUH
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"colorscheme molokai " Install at https://github.com/tomasr/molokai
"let g:molokai_original = 1        " match the original monokai background color
set background=dark               " Let vim know we are on a dark terminal

set showmatch                     " highlight matching [{()}] when text indicator is over them
set mat=2                         " Blink 2 tenths of a second when matching brackets

"set cmdheight=1                   " Height of the command bar
set laststatus=2                  " Always show the status line
"set shortmess=a                   " Decrease Hit ENTER to continue message size

set wrap                          " Wrap lines
set scrolloff=5                   " minimum 5 screen lines above and below the cursor
set number                        " Show line numbers
set cul                           " Highlight current line

set smarttab                      " Be smart when using tabs ;)
set tabstop=2                     " 2 visual spaces per TAB
set softtabstop=2                 " 2 spaces in tab when editing
set shiftwidth=2                  " "
set expandtab                     " Use spaces instead of tabs
set ai                            " Auto indent
set si                            " Smart indent

set colorcolumn=80                " Ruler on column 80
set lbr                           " Linebreak on 500 characters
set tw=500                        " "

"set ruler                         " Current position in lower left corner (not showing /:)
"set showcmd                       " show last command in bottom bar (overwritten by Powerline)

"nnoremap gV `[v`]                 " highlight last inserted text

syntax enable                     " Enable syntax highlighting
set grepprg=grep\ -nH\ $*         " Needed for Syntax Highlighting


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:netrw_browse_split = 1      " Open files in new vertical split
" let g:netrw_liststyle = 3         " Show list of files as tree
" " Hit enter in the file browser to open the selected
" " file with :vsplit to the right of the browser.
" let g:netrw_browse_split = 4
" let g:netrw_winsize = 25					" Smaller: not half the screen like a split

" " Lifted off from http://blog.g14n.info/2013/07/my-vim-configuration.html
" " when navigating a folder, hitting <v> opens a window at right side (default
" " is left side)
" let g:netrw_altv = 1

" augroup ProjectDrawer
" 	autocmd!
" 	autocmd VimEnter * :Vexplore
" augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Hooks
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove trailing whitespaces
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

""""""""""""""""""""""""""""""
" => Visual mode
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map :mexp :e<space><C-d>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" map <space> /                 " Map <Space> to / (search)
" map <c-space> ?               " Map Ctrl-<Space> to ? (backwards search)

set incsearch                 " Makes search act like search in modern browsers
set hlsearch                  " Highlight search results
set ignorecase                " Ignore case when searching
set smartcase                 " When searching try to be smart about cases

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI MODE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set extra options when running in GUI mode
if has ("gui_running")
  set guifont=Source\ Code\ Pro\ for\ Powerline
  set guioptions-=T
  set guioptions+=e
  set t_Co=256
  set guitablabel=%M\ %t
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Thanks to http://amix.dk/vim/vimrc.html and the web in general "
" http://dougblack.io/words/a-good-vimrc.html

" """"" fzf
" set rtp+=/usr/local/opt/fzf
" " ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

" let s:opam_configuration = {}

" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')

" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" " ## end of OPAM user-setup addition for vim / base ## keep this line
" " ## added by OPAM user-setup for vim / ocp-indent ## c2e92acc119ec23ec0ef0d921f77cbd3 ## you can edit, but keep this line
" if count(s:opam_available_tools,"ocp-indent") == 0
"   source "/Users/Kevin/.opam/4.05.0/share/vim/syntax/ocp-indent.vim"
" endif
" " ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
