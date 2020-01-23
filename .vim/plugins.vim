" Title: plugins

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'ajh17/VimCompletesMe'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
Plug 'itchyny/lightline.vim'
Plug 'jalvesaq/Nvim-R'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-easy-align'
Plug 'kovetskiy/sxhkd-vim'
Plug 'lervag/vimtex'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neovimhaskell/haskell-vim'
Plug 'nicholaides/words-to-avoid.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
" Plug 'maximbaz/lightline-ale'
" Plug 'maximbaz/lightline-trailing-whitespace'
Plug 'mhinz/vim-startify'
Plug 'OmniSharp/omnisharp-vim'
Plug 'pangloss/vim-javascript'
" Plug 'plasticboy/vim-markdown'
" Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'PProvost/vim-ps1'
Plug 'scrooloose/nerdtree'
" Plug 'SirVer/ultisnips'
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'ycm-core/YouCompleteMe'

call plug#end()
" }}}

" Plugin Options {{{
" Remap leader {{{
let mapleader = ","
" }}}

" Git Gutter {{{
let g:gitgutter_enabled = 1
let g:gitgutter_eager = 0
let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_highlight_lines = 0
let g:gitgutter_override_sign_column_highlight = 0
" gutter symbols
let g:gitgutter_sign_removed = '-'
" TODO: edit gutter colours
" highlight GitGutterAdd ctermfg=2 ctermbg=0
" highlight GitGutterChange ctermfg=3 ctermbg=0
" highlight GitGutterDelete ctermfg=1 ctermbg=0

" No mappings set by gitgutter with let g:gitgutter_map_keys = 0
nmap <leader>nh <Plug>GitGutterNextHunk
nmap <leader>Nh <Plug>GitGutterPrevHunk
nmap <Leader>gsh <Plug>GitGutterStageHunk
nmap <Leader>guh <Plug>GitGutterUndoHunk
nmap <Leader>gph <Plug>GitGutterPreviewHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual
" }}}

" Lightline Options {{{
let g:lightline = {
    \ 'colorscheme': 'PaperColor',
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
\ }
" }}}

" Color scheme Options {{{
highlight clear SignColumn
set background=dark
colorscheme PaperColor
let g:PaperColor_Theme_Options = {
\   'theme': {
\     'default': {
\       'transparent_background': 1
\     }
\   }
\ }
" Custom function to toggle between light and dark background to keep the
" CursorLine settings since the default way of the solarized plugin also
" changes the CursorLine settings
function Togglebackground()
    let &background = ( &background == "dark"? "light" : "dark" ) 
    highlight LineNr ctermbg=None
    highlight CursorLine ctermbg=None
    highlight CursorLine cterm=Underline
    highlight CursorLineNr ctermbg=None
endfunction
map <F5> :call Togglebackground()<cr>
" }}}

" Easy-motion {{{
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

nmap s <Plug>(easymotion-overwin-f)
" Avoid repetitive use of the h j k l keys.
map <leader><leader>l <Plug>(easymotion-lineforward)
map <leader><leader>j <Plug>(easymotion-j)
map <leader><leader>k <Plug>(easymotion-k)
map <leader><leader>h <Plug>(easymotion-linebackward)
" replace default forward slash searching
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" }}}

" Nvim-R Options {{{
let R_openpdf = 1
" }}}

" Vim-gutentags Options {{{
set statusline+=%{gutentags#statusline()}
let g:gutentags_project_root = [".git","Vagrantfile","Makefile"]
let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_cache_dir = "~/.ctags/project-tags"
" let g:gutentags_enabled = 1
" }}}

" Vim-commentary Options {{{
" To add an unsupported filetype: autocmd FileType apache setlocal commentstring=#\ %s
" }}}

" Vim-surround Options {{{

" }}}

" Omnisharp Options {{{
let g:OmniSharp_server_stdio = 1
" }}}

" Vimwiki Options {{{
set nocompatible
filetype plugin on
syntax on
" nmap <leader><leader>vwnl <Plug>VimwikiNextLink
let g:vimwiki_list = [{'path': '~/Documents/wiki/src/', 'path_html': '~/Documents/wiki/html/'}]
let g:vimwiki_list = [{'path': '~/Documents/wiki/src/', 'syntax': 'markdown', 'ext': '.wiki'}]
" }}}

" FZF Options {{{
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit'
\ }
" }}}

" Wal Options {{{
" colorscheme wal
" }}}

" Vim-latex-live-preview Options {{{
map <Leader>c :LLPStartPreview<cr>
let g:livepreview_previewer = "zathura"
" let g:livepreview_cursorhold_recompile = 0
" }}}

" Easy-align Options {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" Limelight Options {{{
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 240

" Default: 0.5
let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
let g:limelight_bop = '^\s'
let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
let g:limelight_priority = -1
" }}}

" Markdown-preview Options {{{
" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 0

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {}
    \ }

" use a custom markdown style must be absolute path
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
" }}}

" }}}
