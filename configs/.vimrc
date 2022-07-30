let mapleader=','
syntax on
filetype plugin indent on


call plug#begin('~/.vim/plugged')
Plug 'https://gitee.com/itl/vim-airline.git'
Plug 'https://gitee.com/yanzhongqian/nerdtree.git'
Plug 'https://gitee.com/zgpio/tagbar.git'
Plug 'https://gitee.com/yaozhijin/vim-easymotion.git'
Plug 'https://gitee.com/dang050/vim-go.git'
Plug 'https://gitee.com/zgpio/coc.nvim.git'
Plug 'https://gitee.com/hwyang/ultisnips.git'
Plug 'https://gitee.com/yuet_tee/vim-commentary.git'
Plug 'https://gitee.com/nvim-plug-gitee-fork/nvim-autopairs.git'
Plug 'https://gitee.com/foyon/molokai.git'
Plug 'https://gitee.com/myqcyz/ctrlp.vim.git'
Plug 'https://gitee.com/fanjunwei/splitjoin.vim.git'
" Plug 'junegunn/vim-easy-align'
" Plug 'honza/vim-snippets'
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
call plug#end()


" Basic Settings
set nu
set hlsearch
set background=dark
set incsearch
set tabstop=4
set cursorline
set guicursor=a:blinkwait0 " 取消光标闪烁
set omnifunc=syntaxcomplete#Complete
colorscheme molokai
" set showmatch

" Key Maps
nmap <F2> :NERDTree<CR>
nmap <F3> :TagbarToggle<CR>
nmap ss <Plug>(easymotion-s2)
imap jj <ESC>


" vim-go config
set autowrite
autocmd FileType go nmap <leader>rn <Plug>(go-run)
autocmd FileType go nmap <leader>bu :<C-u>call <SID>build_go_files()<CR>
autocmd FileType go nmap <leader>te <Plug>(go-test)
autocmd FileType go nmap <Leader>co <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>if <Plug>(go-info)
autocmd FileType go nmap <Leader>si :GoSameIds<CR>
autocmd FileType go nmap <Leader>de :GoDeclsDir<CR>
autocmd FileType go nmap <Leader>sc :GoSameIdsClear<CR>
autocmd FileType go cmap <Leader>re :GoRename<CR>


autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
let g:airline#extensions#tabline#enabled = 1 " 开启buffers栏
set clipboard=unnamedplus "开启系统剪贴板

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1

" Close scratch preview for OmniComplete
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" autocmd CursorMovedI * if pumvisible() == 0|pclose|endif

" coc config
" Select first.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
