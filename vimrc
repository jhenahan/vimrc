" Modeline and Notes {
" vim: set foldmarker={,} foldlevel=0 foldmethod=marker spell:
"
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

    filetype indent plugin on
    syntax on

    " VAM Setup {
        " Check for VAM installation {
            fun! EnsureVamIsOnDisk(vam_install_path)
                let is_installed_c = "isdirectory(a:vam_install_path.'/vim-addon-manager/autoload')"
                if eval(is_installed_c)
                    return 1
                else
                    if 1 == confirm("Clone VAM into ".a:vam_install_path."?","&Y\n&N")
                        call confirm("Remind yourself that most plugins ship with ".
                                    \"documentation (README*, doc/*.txt). It is your ".
                                    \"first source of knowledge. If you can't find ".
                                    \"the info you're looking for in reasonable ".
                                    \"time ask maintainers to improve documentation")
                        call mkdir(a:vam_install_path, 'p')
                        exec '!git clone --depth=1 git://github.com/MarcWeber/vim-addon-manager '.shellescape(a:vam_install_path, 1).'/vim-addon-manager'
                        exec 'helptags '.fnameescape(a:vam_install_path.'/vim-addon-manager/doc')
                    endif
                    return eval(is_installed_c)
                endif
            endfun
        " }

        " Set up VAM {
            fun SetupVAM()
                let g:vim_addon_manager = {'auto_install' : 1 }
                let vam_install_path = expand('$HOME') . '/.vim/vim-addons'
                exec 'set runtimepath+='.vam_install_path.'/vim-addon-manager'
                call vam#ActivateAddons([], {'auto_install' : 1})
            endfun
            call SetupVAM()
        " }
    " }
" }

