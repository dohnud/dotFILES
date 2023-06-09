" activates filetype detection
filetype plugin indent on

set swapfile
set dir=~/tmp

" activates syntax highlighting among other things
syntax on

" allows you to deal with multiple unsaved
" buffers simultaneously without resorting
" to misusing tabs
set hidden

" just hit backspace without this one and
" see for yourself
set backspace=indent,eol,start

let mapleader = ','

vmap cc :w !pbcopy<cr>
nmap cc v:w !pbcopy<cr>

map gn :bnext<cr>
map gp :bprevious<cr>
map gd :bp<bar>sp<bar>bn<bar>bd<CR>

:set term=xterm
" <ALT+j> ==> ª
" <ALT+k> ==> º
" <ALT+h> ==> ˙
" <ALT+l> ==> ¬
" move lines up and down with alt+j alt+k
nnoremap ª :m .+1<CR>==
nnoremap º :m .-2<CR>==

inoremap ª <Esc>:m .+1<CR>==gi
inoremap º <Esc>:m .-2<CR>==gi

vnoremap ª :m '>+1<CR>gv=gv
vnoremap º :m '<-2<CR>gv=gv

set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on

" Disable Vim's native pack feature
set packpath=
filetype plugin indent on
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:netrw_preview = 1
let g:netrw_altv = 1
let g:netrw_list_hide = '^\.\.\=/\=$,.DS_Store,.idea,.git,__pycache__,venv,node_modules,*\.o,*\.pyc,.*\.swp'
:set mouse=a
let g:netrw_banner = 0
let g:netrw_chgwin = -1 " default (index of window to open files in)
let g:netrw_cursor = 5
:hi CursorLine cterm=NONE ctermbg=darkgreen ctermfg=black guibg=darkgreen guifg=black

au FileType netrw set cursorline
au FileType netrw au BufEnter <buffer> set cursorline
au FileType netrw au BufLeave <buffer> set nocursorline

:hi NonText guifg=bg
highlight EndOfBuffer ctermfg=black

hi netrwCompress term=NONE cterm=NONE gui=NONE ctermfg=10 guifg=green  ctermbg=0 guibg=black
hi netrwData	  term=NONE cterm=NONE gui=NONE ctermfg=9 guifg=blue ctermbg=0 guibg=black
hi netrwHdr	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
hi netrwLex	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
hi netrwYacc	  term=NONE cterm=NONE,italic gui=NONE guifg=SeaGreen1
hi netrwLib	  term=NONE cterm=NONE gui=NONE ctermfg=14 guifg=yellow
hi netrwObj	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
hi netrwTilde	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
hi netrwTmp	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
hi netrwTags	  term=NONE cterm=NONE gui=NONE ctermfg=12 guifg=red
hi netrwDoc	  term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=yellow2 guibg=Blue3
hi netrwSymLink  term=NONE cterm=NONE gui=NONE ctermfg=220 ctermbg=27 guifg=grey60

nmap <silent> <C-CR> t :rightbelow 20vs<CR>:e .<CR>:wincmd h<CR>


augroup netrw_mappings
	autocmd!
	autocmd filetype netrw call Netrw_mappings()
augroup END
function! OpenToRight()
	:rightbelow vnew
	:wincmd p
	:normal P
endfunction
function! Netrw_mappings()
	noremap <buffer> v :call OpenToRight()<cr>
endfunction

nmap <silent> <C-f> :Lex<cr>

:set fillchars+=vert:\  "✧ " ╎ │ ✦
hi VertSplit ctermbg=magenta ctermfg=none
hi LineNr ctermbg=0x000000 ctermfg=4

let @d = 'Vyp'  " duplicate line macro
let @b = "A {\<cr>\<cr>}\<cr>\<Esc>"
autocmd BufEnter * lcd %:p:h " set vim directory to current dir

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')


Plugin 'jansedivy/jai.vim'

Plugin 'habamax/vim-godot'
func! GodotSettings() abort
    setlocal tabstop=4
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'mg979/vim-visual-multi'
let g:VM_leader = ','
let g:VM_Extend_hl = 'Visual'
let g:VM_maps = {}
let g:VM_maps['Motion ,'] = ',,'
let g:VM_maps["Visual Add"]                  = '<C-a>'
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"]   = '<C-k>'
let g:VM_maps['Find Under']                  = ''
let g:VM_maps["Add Cursor At Pos"] = '<C-n>'
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '<C-r>'

Plugin 'xolox/vim-misc'

Plugin 'xolox/vim-easytags'
let g:easytags_auto_highlight = 1
autocmd! WinEnter *.c,*.cpp :HighlightTags
let g:easytags_events = ['BufWritePost', 'BufEnter', 'WinEnter']
let g:easytags_always_enabled = 1
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
hi Function term=bold,italic cterm=bold,italic ctermfg=6 guifg=DarkCyan
" hi cFunctionTag term=italic cterm=italic gui=italic ctermfg=1 ctermbg=0
hi link cFunctionTag Function
hi Type term=italic cterm=italic ctermfg=2 guifg=SeaGreen
hi link cTypeTag Type
" This is a comment
hi Comment term=bold ctermfg=4 guifg=Blue
" TODO FIXME XXX sweet...
hi Todo term=standout ctermfg=0 ctermbg=4 guifg=Blue guibg=Blue

" Plugin 'frazrepo/vim-rainbow'

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'clktmr/vim-gdscript3'

Plugin 'tikhomirov/vim-glsl'
autocmd! BufNewFile,BufRead *.vs,*.fs,*.fsh,*.vsh set ft=glsl

Plugin 'JafarDakhan/vim-gml'

Plugin 'mechatroner/rainbow_csv'

Plugin 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path':'~/Wiki', 'syntax':'markdown', 'ext':'.md', 'diary_rel_path': 'journal/', 'diary_index':'index', 'diary_header': 'Journal', 'diary_sort':'asc'}]
nmap ? <Plug>VimwikiIndex
nmap <C-g> <Plug>VimwikiMakeDiaryNote
nmap <S-h> <Plug>VimwikiDiaryPrevDay
nmap <S-l> <Plug>VimwikiDiaryNextDay
set concealcursor=nc

Plugin 'preservim/nerdcommenter'
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal


set number

" set cursorline
" set cursorcolumn

set shiftwidth=4
set tabstop=4
set softtabstop=4

set backupcopy=yes
