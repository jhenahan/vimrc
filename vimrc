" Vim ASCII and authorship {
"  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
"  .                                                                         .
"  .                                                                         .
"  .                                 ,ji,                                    .
"  .          ,@HHHHHHHHHHHHHHHHHHH "!:!!Y*,  ,HHHHHHHHHHHHHHHHHHHt          .
"  .          'QYY?00000000000VYYYT ;!!!!!!<= <2YYV00000000000002Yr          .
"  .              #000000000001I ,..!!!!!!!!!=  vd80000000000PY=^            .
"  .              #00U000U000U1I ;!!!!!!!:!' vdH800000000U0YI^               .
"  .              #000000000001I ;!!!!!!'`vd9t00%0000000Y*^`                 .
"  .              #000000000001I ;!!!'`vd9S%%00000000V1^`.                   .
"  .              #0000U00U00U1I :'`,dPH%0000000002Yr^,.!=T),                .
"  .          .;` #000000000001I ,aPHJ0000000000Y/^ .=!!!!+!TT*,             .
"  .       .,VY:` #000U000000014MHJ%00000^"''''^ .=!!!!!!!!!:!!<Ts,          .
"  .       '=!:!` #000000000U0mG00000000"' hnv  +!!!!!!!:!!!!!!=:``          .
"  .          `=' #0000000U000000000000V" d%%" ;!!!!!!:!!!!!:=``             .
"  .            ` #000U0000000000000VY`'       ''``'"""'``''`                .
"  .              #000000000000U00Yr^ ' U002 . "U00N>=vJ0UNn>=JU00\          .
"  .              #0000000U000U?*^ .<` JU02 .' J00^.-- J00~   .U00'          .
"  .              #0000U0000%*^`-=!!` JU02 .  J00F-`  J00(    d%02           .
"  .              #0000002Y'` -^!!!" J002    J002    JU02    J002            .
"  .              YPYYYY='     `'===......<=                                 .
"  .                              `==!!+!=``                                 .
"  .                                 `-'`         Config File                .
"  .                                                    by jhenahan          .
"  .                                                                         .
"  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .
"
" }

" Env {
    " Compat and clipboards {
    set nocompatible " must be first line

    if $SHELL =~ 'bin/fish'
        set shell=/usr/local/bin/zsh
    endif
    if has ("unix") && "Darwin" != system("echo -n \"$(uname)\"")
        " on Linux use + register for copy-paste
        set clipboard=unnamedplus
    else
        " on mac and windows, use * register for copy-paste
        set clipboard=unnamed
    endif
    " }

    " Win Compat (for those dark times) {
        " Use '.vim' instead of 'vimfiles'
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
" }
" Local {
    " System-specific settings (guifont, local packages, etc.) go here
    " This is also where you set g:addon_groups
        if filereadable(expand("~/.vimrc.local"))
            source ~/.vimrc.local
        endif
"}
" General settings {
    let mapleader=','         " do people really use \?
    set background=dark       " Because dark backgrounds are nice
    set t_Co=256              " The colors, Duke, the colors!

    filetype indent plugin on " filetypes are nice
    syntax on                 " highlighting is nicer
    scriptencoding utf-8
    " uncomment the following lines to admit your weakness
    " set mouse=a               " automatically enable mouse usage
    " set mousehide             " hide the mouse cursor while typing

    " Automatically change directory when opening a new buffer
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    set shortmess+=filmnrxoOtT                      " abbreviates messages because 'Hit enter' is dumb
    set viewoptions=folds,options,cursor,unix,slash " more compat stuff
    set virtualedit=onemore                         " allow cursor beyond last character
    set history=1000                                " Bigger is better
    set spell                                       " spell checking
    set hidden                                      " don't unload file when buffer is abandoned

    " Backups and undofile {
        set nobackup              " First, backups are mostly just annoying
        set nowritebackup         " Second, I use CodeKit
        set noswapfile
        if has('persistent_undo')
            set undofile          " As long as we're backing up, we can also
            set undolevels=1000   " back up the other way
            set undoreload=10000
        endif
    " }
    " Files for vim to ignore in filename completion {
    setlocal suffixes+=
        \.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,
        \.idx,.ilg,.inx,.out,.toc,.pyc,.pyo,
        \.jpg,.bmp,.gif,.png,.tif,.tiff,
        \.wmv,.avi,.mpg,.mpeg,.asf,.flv,.mov,
        \.wav,.aif,.aiff,.mp3,.flac,.mp4,
	\.pdf,.hi,.gz,.fls,.fdb_latexmk
    " }

    set title   " show the title of the active file
" }
" Addons {
    " Use a separate addon config file to keep the main vimrc clean {
        if filereadable(expand("~/.vimrc.addons"))
            source ~/.vimrc.addons
        endif
    " }
" }
" UI {
    colorscheme solarized       " I'm taking suggestions on a new colorscheme

    set tabpagemax=15           " a reasonable maximum number of tabs to show
    set showmode                " show current mode
    set cursorline              " highlight current line
    set guioptions-=r           " Turn off the right scrollbar
    " changes the insert cursor to a pipe rather than a block
    if !has("gui_running")
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    endif

    if has('cmdline_info')
        set ruler                                          " helpful at times; may remove later, though
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " crazy ruler
        set showcmd                                        " show partial commands, etc.
    endif
    set backspace=indent,eol,start  " sane backspacing
    set linespace=0                 " no weird line spacing
    set nu                          " line numbers
    set showmatch                   " show matching brackets and parens
    setlocal matchtime=1
    set incsearch                   " incremental search
    set hlsearch                    " highlight search terms
    set winminheight=0              " zero height windows
    set ignorecase                  " case insensitive search; may turn into a config option
    set smartcase                   " case sensitive when there are uppercase letters in the search
    set wildmenu                    " show completion list
    set wildmode=list:longest,full  " tab completion
    set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap
    set scrolljump=8                " lines to scroll when cursor leaves screen
    set scrolloff=4                 " minimum lines above or below cursor
    set foldenable                  " code folding
    set list
    " some people dislike listchars, but I think they're okay
    " this just displays whitespace that could be missed
    set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\ 
" }
" Formatting {
    set nowrap              " wrap long lines
    set autoindent          " this has a few quirks; look into it
    set shiftwidth=4        " 4 space indents
    set expandtab           " tabs are spaces
    set tabstop=4           " 4 column tabstops
    set softtabstop=4       " backspace deletes indents
    set pastetoggle=<F12>   " sane paste behavior
    nnoremap <leader>r gqip " reflow text automatically in normal mode
    vnoremap <leader>r gq   " reflow selected text

" }

" Remapped Keys {
    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk
    " Save some shifting
    nnoremap ; :

    if has('user_commands') " some useful shifted commands
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif

    nnoremap Y y$           " for consistency

    " Code folding options {
    nmap <leader>f0 :set foldlevel=0<CR>
    nmap <leader>f1 :set foldlevel=1<CR>
    nmap <leader>f2 :set foldlevel=2<CR>
    nmap <leader>f3 :set foldlevel=3<CR>
    nmap <leader>f4 :set foldlevel=4<CR>
    nmap <leader>f5 :set foldlevel=5<CR>
    nmap <leader>f6 :set foldlevel=6<CR>
    nmap <leader>f7 :set foldlevel=7<CR>
    nmap <leader>f8 :set foldlevel=8<CR>
    nmap <leader>f9 :set foldlevel=9<CR>
    " }

    " clearing highlighted search
    nnoremap <silent> <leader>/ :let @/ = ""<CR>

    " Some helpers to edit mode
    " http://vimcasts.org/e/14
    cnoremap %% <C-R>=expand('%:h').'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%

    " Neat little thing. <leader>ff displays a list of occurrences of the word under point and
    " asks which to jump to
    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

    nnoremap <Leader>m :make<CR>
" }

" Omnicomplete {
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
                    \if &omnifunc == "" |
                    \setlocal omnifunc=syntaxcomplete#Complete |
                    \endif
    endif

    hi Pmenu      guifg=#000000 guibg=#F8F8F8          ctermfg=black     ctermbg=Lightgray
    hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan  ctermbg=lightgray cterm=NONE
    hi PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan  cterm=NONE

    " some convenient mappings
    inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
    " automatically open and close the popup menu/preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif
    set completeopt=menu,preview,longest
" }
" Adds a little functionality for local addon activation {
    if filereadable(expand('~/.vimrc.addons.local'))
        source ~/.vimrc.addons.local
    endif
" }


" Functions {
    function! InitializeDirectories()
        let separator = "."
        let parent    = $HOME
        let prefix    = '.vim'
        let dir_list  = {
                    \ 'backup' : 'backupdir',
                    \ 'views'  : 'viewdir',
                    \ 'swap'   : 'directory' }

        if has('persistent_undo')
            let dir_list['undo'] = 'undodir'
        endif

        for [dirname, settingname] in items(dir_list)
            let directory = parent . '/' . prefix . dirname . "/"
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()

    function! NERDTreeInitAsNeeded()
        redir => bufoutput
        buffers!
        redir END
        let idx = stridx(bufoutput, "NERD_tree")
        if idx > -1
            NERDTreeMirror
            NERDTreeFind
            wincmd l
        endif
    endfunction
" }
