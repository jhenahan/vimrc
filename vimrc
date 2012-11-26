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
" }

" UI {
    colorscheme zenburn         " Zenburn because it looks nicer in terminal
                                " than Solarized

    set tabpagemax=15           " a reasonable maximum number of tabs to show
    set showmode                " show current mode
    set cursorline              " highlight current line

    if has('cmdline_info')
        set ruler               " helpful at times; may remove later, though
        set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " crazy ruler
        set showcmd             " show partial commands, etc.
    endif

    " Statusline {
        if has('statusline')
            set laststatus=2
    " }

" }
