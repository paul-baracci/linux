:set number relativenumber " Relative instead of absolute line numbers
:set incsearch 
:set hlsearch

:set completeopt=longest,menuone
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
:inoremap <S-Tab> <C-X><C-O>
autocmd FileType php setlocal omnifunc=phpactor#Complete

let g:indentLine_char = '┊'
" 4 character tab
:set shiftwidth=4
:set softtabstop=4
:set expandtab
:set noswapfile
" Awesome cmd completion
:set wildmenu
:set wildignore+=**/node_modules/**
:nnoremap <leader>ev :vsplit ~/.vimrc<cr>
:set ignorecase " Ignores case when searching
:set smartcase " Unless you're using uppercase
:set lazyredraw
:set backspace=indent,eol,start
:set confirm
:set ruler
:set showcmd
" colorscheme murphy
set cursorline
:syntax enable
:filetype plugin indent on
:set smartindent
:set autoindent
:autocmd FileType netrw setl bufhidden=delete
:set nocompatible
:set path+=**
:set matchpairs+=<:>

:let g:netrw_keepdir = 0
:let g:netrw_winsize = 25
:let g:netrw_banner = 0

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" :let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
:let g:netrw_localcopydircmd = 'cp -r'
:let g:netrw_browse_split = 4
:set splitright
:set splitbelow
:let g:netrw_altv = 1
:let g:netrw_liststyle = 3
" augroup ProjectDrawer
" 	autocmd!
" 	autocmd VimEnter * :Lexplore
" augroup END

function! ToggleNetrw()
        let i = bufnr("$")
        let wasOpen = 0
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
                let wasOpen = 1
            endif
            let i-=1
        endwhile
    if !wasOpen
        silent Lexplore
    endif
endfunction

function! ToggleWindowHorizontalVerticalSplit()
  if !exists('t:splitType')
    let t:splitType = 'vertical'
  endif

  if t:splitType == 'vertical' " is vertical switch to horizontal
    windo wincmd K
    let t:splitType = 'horizontal'

  else " is horizontal switch to vertical
    windo wincmd H
    let t:splitType = 'vertical'
  endif
endfunction

nnoremap <C-@> :find 
nnoremap <C-p> :call ToggleWindowHorizontalVerticalSplit() <CR> 
map <silent><F3> :call ToggleNetrw() <CR>
