syntax on
set ignorecase smartcase
set incsearch hlsearch

set hidden
set wildmenu
set showcmd
set shell=/bin/zsh
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set mouse=a
set cmdheight=2
set relativenumber
set nu rnu
set notimeout ttimeout ttimeoutlen=200

set shiftwidth=4
set softtabstop=4
set expandtab
set background=dark
set scrolloff=10

autocmd FileType gitcommit set textwidth=72
autocmd FileType gitcommit set colorcolumn=73

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
