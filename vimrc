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

    if has ("unix") && "Darwin" != system("echo -n \"$(uname)\"")
        " on Linux use + register for copy-paste
        set clipboard=unnamedplus
    else
        " on mac and windows, use * register for copy-paste
        set clipboard=unnamed
    endif
    " }

    " Win Compat (for those dark times) {
        " Use '.vim' instead of 'vimfiles'; this makes
        if has('win32') || has('win64')
            set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
        endif
    " }
" }

" Addons {
    " Use a separate addon config file to keep the main vimrc clean {
        if filereadable(expand("~/.vimrc.addons"))
            source ~/.vimrc.addons
        endif
    " }
" }

" General settings {
    set background=dark " Because dark backgrounds are nice
    set t_Co=256        " The colors, Duke, the colors!

    filetype indent plugin on   " filetypes are nice
    syntax on                   " highlighting is nicer
    scriptencoding utf-8
    " uncomment the following lines to admit your weakness
    " set mouse=a               " automatically enable mouse usage
    " set mousehide             " hide the mouse cursor while typing

    " Automatically change directory when opening a new buffer
    autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

    set shortmess+=filmnrxoOtT  " abbreviates messages because 'Hit enter' is dumb
    set viewoptions=folds,options,cursor,unix,slash " more compat stuff
    set virtualedit=onemore     " allow cursor beyond last character
    set history=1000            " Bigger is better
    set spell                   " spell checking
    set hidden                  " don't unload file when buffer is abandoned

    " Backups and undofile {
        set backup              " Better safe than sorry?
        if has('persistent_undo')
            set undofile        " As long as we're backing up, we can also
            set undolevels=1000 " back up the other way
            set undoreload=10000
        endif
    " }
    " Files for vim to ignore in filename completion {
    setlocal suffixes+=
        \.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,
        \.idx,.ilg,.inx,.out,.toc,.pyc,.pyo,
        \.jpg,.bmp,.gif,.png,.tif,.tiff,
        \.wmv,.avi,.mpg,.mpeg,.asf,.flv,.mov,
        \.wav,.aif,.aiff,.mp3,.flac,.mp4
    " }

    set title   " show the title of the active file
" }

" UI {
    colorscheme zenburn         " Zenburn because it looks nicer in terminal
                                " than Solarized

    set tabpagemax=15           " a reasonable maximum number of tabs to show
    set showmode                " show current mode
    set cursorline              " highlight current line
    " changes the insert cursor to a pipe rather than a block
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"

    if has('cmdline_info')
        set ruler               " helpful at times; may remove later, though
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " crazy ruler
        set showcmd             " show partial commands, etc.
    endif

    " Statusline {
        if has('statusline')
            setlocal laststatus=2
            " and now we build up a sweet statusline
            set statusline=%<%f                      " filename
            set statusline+=%w%h%m%r                 " options
            set statusline+=%{fugitive#statusline()} " git
            set statusline+=\ [%{&ff}/%Y]            " filetype
            set statusline+=\ [%{getcwd()}]          " working directory
            set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " right aligned nav info
        endif
    " }

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
    set nowrap " wrap long lines
    set autoindent " this has a few quirks; look into it
    set shiftwidth=4 " 4 space indents
    set expandtab       " tabs are spaces
    set tabstop=4       " 4 column tabstops
    set softtabstop=4   " backspace deletes indents
    set pastetoggle=<F12> " sane paste behavior

" }

" Remapped Keys {
    let mapleader=','       " do people really use \?

    " Wrapped lines goes down/up to next row, rather than next line in file.
    nnoremap j gj
    nnoremap k gk

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
" }

" Omnicomplete {
    if has("autocmd") && exists("+omnifunc")
        autocmd Filetype *
                    \if &omnifunc == "" |
                    \setlocal omnifunc=syntaxcomplete#Complete |
                    \endif
    endif

    hi Pmenu guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
    hi PmenuSbar guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
    hi PmenuThumb guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE

    " some convenient mappings
    inoremap <expr> <Esc>   pumvisible() ? "\<C-e>" : "\<Esc>"
    inoremap <expr> <CR>    pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <expr> <Down>  pumvisible() ? "\<C-n>" : "\<Down>"
    inoremap <expr> <Up>    pumvisible() ? "\<C-p>" : "\<Up>"
    inoremap <expr> <C-d>   pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    inoremap <expr> <C-u>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
    " automatically open and close the popup menu/preview window
    au CursorMovedI,InsertLeave * if pumvisible() == 0 | silent! pclose | endif
    set completeopt=menu,preview,longest
" }

" Ctags {
    set tags=./tags;/,~/.vimtags
" }

" AutoCloseTag {
    " Make it so AutoCloseTag works for xml and xhtml files as well
    au FileType xhtml,xml ru ftplugin/html/autoclosetag.vim
    nmap <Leader>ac <Plug>ToggleAutoCloseMappings
" }

" NerdTree {
    map <C-e> :NERDTreeToggle<CR>:NERDTreeMirror<CR>
    map <leader>e :NERDTreeFind<CR>
    nmap <leader>nt :NERDTreeFind<CR>

    let NERDTreeShowBookmarks=1
    let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeShowHidden=1
    let NERDTreeKeepTreeInNewTab=1
    let g:nerdtree_tabs_open_on_gui_startup=0
" }

" Tabularize shortcuts {
    nmap <leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR> <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:<CR>
    vmap <Leader>a: :Tabularize /:<CR>
    nmap <Leader>a:: :Tabularize /:\zs<CR>
    vmap <Leader>a:: :Tabularize /:\zs<CR>
    nmap <Leader>a, :Tabularize /,<CR>
    vmap <Leader>a, :Tabularize /,<CR>
    nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
" }

" Buffer explorer {
    nmap <leader>b :BufExplorer<CR>
" }

" JSON {
    nmap <leader>jt <Esc>:%!python -m json.tool<CR><Esc>:set filetype=json<CR>
" }

" PyMode {
    let g:pymode_lint_checker = "pyflakes"
" }

" ctrlp {
    let g:ctrlp_working_path_mode = 2
    nnoremap <silent> <D-t> :CtrlP<CR>
    nnoremap <silent> <D-r> :CtrlPMRU<CR>
    let g:ctrlp_custom_ignore = {
                \ 'dir': '\.git$\|\.hg$\|\.svn$',
                \ 'file': '\.exe$\|\.so$\|\.dll$' }
" }

" TagBar {
    nnoremap <silent> <leader>tt :TagbarToggle<CR>
" }

" PythonMode {
    " Disable if python support not present
    if !has('python')
        let g:pymode = 1
    endif
" }

" Fugitive {
    nnoremap <silent> <leader>gs :Gstatus<CR>
    nnoremap <silent> <leader>gd :Gdiff<CR>
    nnoremap <silent> <leader>gc :Gcommit<CR>
    nnoremap <silent> <leader>gb :Gblame<CR>
    nnoremap <silent> <leader>gl :Glog<CR>
    nnoremap <silent> <leader>gp :Git push<CR>
" }

" neocomplcache {
    let g:acp_enableAtStartup = 0
    let g:neocomplcache_enable_at_startup = 1
    let g:neocomplcache_enable_camel_case_completion = 1
    let g:neocomplcache_enable_smart_case = 1
    let g:neocomplcache_enable_underbar_completion = 1
    let g:neocomplcache_enable_auto_delimiter = 1
    let g:neocomplcache_max_list = 15
    let g:neocomplcache_force_overwrite_completefunc = 1

" SuperTab like snippets behavior.
    imap <silent><expr><TAB> neosnippet#expandable() ?
                \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
                \ "\<C-e>" : "\<TAB>")
    smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

" Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = { 'default' : '' }

" Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns._ = '\h\w*'

" Plugin key-mappings.
    imap <C-k> <Plug>(neosnippet_expand_or_jump)
    smap <C-k> <Plug>(neosnippet_expand_or_jump)
    inoremap <expr><C-g> neocomplcache#undo_completion()
    inoremap <expr><C-l> neocomplcache#complete_common_string()
    inoremap <expr><CR> neocomplcache#complete_common_string()

" <TAB>: completion.
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" <CR>: close popup
" <s-CR>: close popup and save indent.
    inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
    inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y> neocomplcache#close_popup()

" Enable omni completion.
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
    if !exists('g:neocomplcache_omni_patterns')
        let g:neocomplcache_omni_patterns = {}
    endif
    let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
    let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
    let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
    let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'

" use honza's snippets
    let g:neosnippet#snippets_directory='~/.vim/bundle/snipmate-snippets/snippets'

" For snippet_complete marker.
    if has('conceal')
        set conceallevel=2 concealcursor=i
    endif
" }

" UndoTree {
    nnoremap <Leader>u :UndotreeToggle<CR>
    let g:undotree_SetFocusWhenToggle=1 " if undotree is opened, it is likely one wants to interact with it.
" }

" indent_guides {
    if !exists('g:spf13_no_indent_guides_autocolor')
        let g:indent_guides_auto_colors = 1
    else
        " for some colorscheme ,autocolor will not work,like 'desert','ir_black'.
        autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd guibg=#212121 ctermbg=3
        autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#404040 ctermbg=4
    endif
    set ts=4 sw=4 et
    let g:indent_guides_start_level = 2
    let g:indent_guides_guide_size = 1
    let g:indent_guides_enable_on_vim_startup = 1
" }

" Functions {
    function! InitializeDirectories()
        let separator = "."
        let parent = $HOME
        let prefix = '.vim'
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory' }

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
