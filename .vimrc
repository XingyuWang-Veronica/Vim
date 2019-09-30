" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
set t_Co=256
syntax on

" Specify a directory for plugins
" " - For Neovim: ~/.local/share/nvim/plugged
" " - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Color Scheme
Plug 'morhetz/gruvbox'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}                                                                      
Plug 'junegunn/fzf.vim' 

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Golang"
Plug 'fatih/vim-go'
"Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile', 'branch': 'release' }

" Language support
" Use release branch
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

" Initialize plugin system
call plug#end()

"set runtimepath^=~/.vim/vim-ctrlp-cscope
set runtimepath^=~/.vim/bundle/ctrlp.vim
"set runtimepath^=~/.vim/coc.nvim

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
set background=dark
colorscheme gruvbox

" navigation                                                                                                                         
" treat long lines as break lines                                                                                                    
map j gj                                                                                                                             
map k gk

set rtp+=~/.fzf

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:go_highlight_trailing_whitespace_error=0
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

let g:coc_node_path='/usr/bin/nodejs'

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden			" Hide buffers when they are abandoned
" set mouse=a			" Enable mouse usage (all modes)
" set number		" Show line numbers                                                                   
set laststatus=2    " Always show status line

" indentation                                                                                                                    
" set expandtab       " replace tab with spaces                                                                                    
set tabstop=4       " number of spaces for tab                                                                                   
set autoindent      " copy indent from current line                                                                              
set shiftwidth=4    " number of spaces for autoindent step

" search                                                                                                                             
set hlsearch    " highlight search results                                                                                           
set incsearch   " incremental search                                                                                                 
set ignorecase  " ignore case                                                                                                        
set smartcase   " don't ignore case when pattern contains uppercase letters

" fzf                                                                                                                                
nmap <c-p> :Files<cr>                                                                                                                
nmap <c-n> :Buffers<cr>

" cscope                                                                                                                             
if has("cscope")                                                                                                                     
" add any database in current directory                                                                                          
  if filereadable("cscope.out")                                                                                                    
    cs add cscope.out                                                                                                            
  " else add database pointed to by environment                                                                                    
  elseif $CSCOPE_DB != ""                                                                                                          
    cs add $CSCOPE_DB
  endif    
endif

" -------------------------------------------------------------------------------------------------
"  " coc.nvim default settings
"  "
"  -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other
" plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" nmap <unique> <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>                                                                      
" nmap <unique> <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>                                                                      
" nmap <unique> <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>                                                                      
" nmap <unique> <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>                                                                      
" nmap <unique> <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>                                                                      
" nmap <unique> <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>                                                                      
" nmap <unique> <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>                                                                    
" nmap <unique> <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>                                                                      
" nmap <unique> <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>                                                                 
" nmap <unique> <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>                                                                 
" nmap <unique> <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>                                                                 
" nmap <unique> <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>                                                                 
" nmap <unique> <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>                                                                 
" nmap <unique> <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>                                                                 
" nmap <unique> <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>                                                               
" nmap <unique> <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>                                                                 
" nmap <unique> <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>                                                   
" nmap <unique> <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>                                                   
" nmap <unique> <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>                                                   
" nmap <unique> <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>                                                   
" nmap <unique> <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>                                                   
" nmap <unique> <C-Space><C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>                                                   
" nmap <unique> <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>                                                 
" nmap <unique> <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

