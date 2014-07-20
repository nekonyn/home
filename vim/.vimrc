""" --- Init ---
set nocompatible

" Indent
set tabstop=4
set shiftwidth=4
set tabstop=4
set showmatch

set shiftround

set autoindent
set smartindent

" Search
set incsearch
set ignorecase

set hlsearch

" BackupFile
set nobackup
set noswapfile

""" --- Encoding ---
set encoding=utf-8
scriptencoding utf-8

set fileencoding=utf08
set fileencodings=utf-8,sjis,cp932

set fileformat=unix
set fileformats=unix,dos,mac

""" --- NeoBundle ---

if isdirectory(expand("~/.vim/bundle"))
	" startup add neobubdle.vim to runtimepath
	if has('vim_starting')
		set nocompatible
		set runtimepath+=~/.vim/bundle/neobundle.vim
	endif

	" Init neobundle.vim
	call neobundle#rc(expand('~/.vim/bundle'))
	NeoBundleFetch 'Shougo/neobundle.vim'

	"" -- Plugin list

	" Common
	NeoBundle 'itchyny/lightline.vim'
	NeoBundle 'Shougo/vimshell.vim'
	NeoBundle 'Shougo/vimfiler.vim'
	NeoBundle 'https://github.com/sjl/gundo.vim'
	NeoBundle 'Shougo/vimproc', {
				\ 'build' : {
				\     'mac' : 'make -f make_mac.mak',
				\     'unix' : 'make -f make_unix.mak',
				\    },
				\ }

	" Unite
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'ujihisa/unite-colorscheme'
	NeoBundle 'h1mesuke/unite-outline'

	" ColorSchema
	NeoBundle 'wombat256.vim'
	
	" Completion
	NeoBundle "Shougo/neocomplete.vim"

	" Html
	NeoBundle "othree/html5.vim"
	NeoBundle "hail2u/vim-css3-syntax"

	" sphinx
	NeoBundle "Rykka/riv.vim"
	NeoBundle "heavenshell/vim-quickrun-hook-sphinx"

	" JavaScript
	NeoBundle "jelera/vim-javascript-syntax"
	NeoBundle "pangloss/vim-javascript"
	filetype plugin indent on

	NeoBundleCheck
endif

""" --- Plugin Options ---

" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
let g:unite_data_directory = expand("~/.vim/tmp/unite")

" unite outline
let g:unite_split_rule = 'botright'

" VimShell
let g:vimshell_interactive_update_time = 10
let g:vimshell_prompt = $USERNAME."% "
let g:vimshell_temporary_directory = expand("~/.vim/tmp/vimshell")

" vimfiler
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_data_directory = expand("~/.vim/tmp/vimfiler")

" NeoComplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#data_directory = expand("~/.vim/tmp/neocomplete")

""" --- KeyMap ---

" us keyboard - change ; to :
nnoremap ; :
nnoremap : ;
vnoremap : ;
vnoremap ; :

set backspace=start,eol,indent

" Cursolkey move
set whichwrap=b,s,[,],,~

" unite
nnoremap <silent> <Space>b :<C-u>Unite buffer<CR>
nnoremap <silent> <Space>f :<C-u>UniteWithBufferDir -buffer-name=filesfile<CR>
nnoremap <silent> <Space>r :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> <Space>m :<C-u>Unite file_mru<CR>

" unite outline
noremap <Space>o <ESC>:Unite -vertical -winwidth=40 outline<Return>

" vimshell map
nnoremap <silent> vs :VimShell<CR>
nnoremap <silent> vsc :VimShellCreate<CR>
nnoremap <silent> vp :VimShellPop<CR>

" vimfiler
nnoremap <silent> vf :VimFiler -split -simple -winwidth=35 -no-quit<CR>

" NeoComplete
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup().”\<C-h>”

" Gundo
nnoremap <silent> gu :<C-u>GundoToggle<CR>

""" --- View ---
set t_Co=256
colorscheme wombat256mod
syntax on
nmap <ESC><ESC> ;nohlsearch<CR><ESC>

set lcs=tab:>_,trail:_,extends:\
set list

" StatusLine
set laststatus=2
set statusline=[%{&fileencoding}][\%{&fileformat}]\ %F%m%r%=<%c:%l>
set cursorline
set number

" CommandLine Complte View
set wildmenu wildmode=list:full

