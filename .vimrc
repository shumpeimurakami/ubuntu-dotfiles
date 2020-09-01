set nobackup
set number
set noundofile
set backspace=2
set encoding =utf-8
"show command mode with tab key
set title
"highlight search
set smartcase
"start search 1 character
set expandtab
"search a A
set ignorecase
set ic

nnoremap j gj
nnoremap k gk

" Êí¶ñÌ¶Fð©FÉ·é
hi Constant ctermfg=14
set virtualedit=onemore
set cursorline
set statusline+=%m
" CfgÌ¸êðh®

noremap <S-h>   ^
noremap <S-j>   }
noremap <S-k>   {
noremap <S-l>   $
nnoremap <Space>v :vs

"Xy`bJ[

" set spelllang=en,cjk

syntax on

set t_Co=256

inoremap <silent> jj <ESC>

colorscheme slate


call plug#begin()
Plug 'Shougo/neobundle.vim'
Plug 'Shougo/unite.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'reireias/vim-cheatsheet'
Plug 'scrooloose/nerdtree'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-sensible'
Plug 'davidhalter/jedi-vim', {'for': 'python'} 
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'elixir-editors/vim-elixir'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
"markdown-preview
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.vim'
"replace word plugin
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
"highlight replace word
Plug 'osyo-manga/vim-over'
"expand region
Plug 'terryma/vim-expand-region'
"comfortable motion
Plug 'yuttie/comfortable-motion.vim'
"modify nerdtree toggle
Plug 'ryanoasis/vim-devicons'
"close ()
Plug 'cohama/lexima.vim'
"emmet
Plug 'mattn/emmet-vim'
"fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'rking/ag.vim'
"commentout
Plug 'tpope/vim-commentary'
"quickrun
Plug 'thinca/vim-quickrun'
call plug#end()


" Plugin key-mappings.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
   set conceallevel=2 concealcursor=niv
endif

" snippets making
let g:neosnippet#snippets_directory='$VIM/.vim/bundle/neosnippet-snippets/snippets/'

",$VIM/.vim/snippets'

let mapleader = "\<Space>"
" der>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


map <C-n> :NERDTreeToggle<CR>


let g:cheatsheet#cheat_file='$VIM/cheatsheet.md'

" set pythonthreedll=C:\Users\murakami\AppData\Local\Programs\Python\Python36\python36.dll


"Unite settings below 
" unite.vimÌÝè
noremap <C-U><C-F> :Unite -buffer-name=file file<CR> " t@Cê
noremap <C-U><C-R> :Unite file_mru<CR> " ÅßgÁ½t@Cê

au FileType unite nnoremap <silent> <buffer> <expr> <C-i> unite#do_action('split') " EBhEðªµÄJ­
au FileType unite inoremap <silent> <buffer> <expr> <C-i> unite#do_action('split')

" ESCL[ð2ñ·ÆI¹·é
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>

"enable elixir
filetype plugin indent on
"aysncomplete
inoremap <expr><C-j>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr><C-l> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

"asyncomplete register snippet
call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
    \ 'name': 'neosnippet',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
    \ }))

"replace keymap

"replace highlight
nnoremap <silent> <Space>o :OverCommandLine<CR>%s/
vnoremap <silent> <Space>o :OverCommandLine<CR>s//g<Left><Left>


"expand region settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

"comfortable motion settings
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

"modify nerdtree
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['vue'] = ''
" アイコン入力方法 : `[Ctrl+V]` > `[u]` > `e905`
let g:NERDTreeExtensionHighlightColor = {}
let g:NERDTreeExtensionHighlightColor['vue'] = '42B983'

" fzf settings 
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)
nnoremap <silent> <Leader>t :GFiles<CR>
nnoremap <silent> <Leader>q :Files<CR>

" color popup
hi Pmenu ctermbg=7 ctermfg=0
hi PmenuSel ctermbg=2 ctermfg=0

" lsp settings
let g:lsp_settings = {
\   'pyls': {
\     'workspace_config': {
\       'pyls': {
\         'configurationSources': ['flake8']
\       }
\     }
\   },
\}
let g:lsp_highlights_enabled = 0
let g:lsp_textprop_enabled = 0
