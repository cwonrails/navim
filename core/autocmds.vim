" go back to previous position of cursor if any
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe 'normal! g`"zvzz' |
    \ endif

autocmd FileType js,scss,css autocmd BufWritePre <buffer> call NavimStripTrailingWhitespace()
autocmd FileType css,scss setlocal foldmethod=marker foldmarker={,}
autocmd FileType css,scss nnoremap <silent> <SID>sort vi{:sort<CR>
autocmd FileType css,scss nmap <LocalLeader>s <SID>sort
autocmd FileType python autocmd BufWritePre <buffer> call NavimStripTrailingWhitespace()
autocmd FileType python setlocal foldmethod=indent
autocmd FileType php autocmd BufWritePre <buffer> call NavimStripTrailingWhitespace()
autocmd FileType coffee autocmd BufWritePre <buffer> call NavimStripTrailingWhitespace()
autocmd FileType vim setlocal foldmethod=indent keywordprg=:help

" vim-jsbeautify
if dein#is_sourced('vim-jsbeautify')
  autocmd FileType javascript nnoremap <silent> <SID>js-beautify :call JsBeautify()<CR>
  autocmd FileType javascript nmap <LocalLeader>j <SID>js-beautify
endif

" quickfix window always on the bottom taking the whole horizontal space
autocmd FileType qf wincmd J


" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

