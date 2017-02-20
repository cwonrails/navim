" functions {{{

"}}}

"if s:is_neovim || (v:version >= 800) "{{{
  "call dein#add('Shougo/denite.nvim')
"}}}
"else "{{{

function! s:on_unite_source() abort
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
  call unite#filters#sorter_default#use(['sorter_rank'])
  call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern',
      \ '\.git/\|\.hg/\|\.svn/\|\.tags$\|cscope\.\|\.taghl$\|\.DS_Store$')
  call unite#custom#profile('default', 'context', {
      \ 'start_insert': 1
      \ })
endfunction

"call dein#add('Shougo/unite.vim', {'on_cmd': ['Unite','UniteWithCurrentDir','UniteWithBufferDir',
"    \ 'UniteWithProjectDir','UniteWithInput','UniteWithInputDirectory','UniteWithCursorWord']}) "{{{
call dein#add('Shougo/unite.vim', {'hook_post_source': function('s:on_unite_source')}) "{{{
  if executable('sift')
    let g:unite_source_grep_command = 'sift'
    let g:unite_source_grep_default_opts = '-i --no-color'
    let g:unite_source_grep_recursive_opt = ''
  elseif executable('ag')
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
        \ '-i --vimgrep --hidden --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
  elseif executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
  elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
  endif

  function! s:unite_settings()
    nmap <buffer> Q <Plug>(unite_exit)
    nmap <buffer> <Esc> <Plug>(unite_exit)
    imap <buffer> <Esc> <Plug>(unite_exit)
  endfunction
  autocmd FileType unite call s:unite_settings()
"}}}

call dein#add('Shougo/neomru.vim', {'depends': 'Shougo/unite.vim'})
call dein#add('osyo-manga/unite-airline_themes', {'depends': 'Shougo/unite.vim'})
call dein#add('ujihisa/unite-colorscheme', {'depends': 'Shougo/unite.vim'})
call dein#add('tsukkee/unite-tag', {'depends': 'Shougo/unite.vim'})
call dein#add('hewes/unite-gtags', {'depends': 'Shougo/unite.vim'})
call dein#add('Shougo/unite-outline', {'depends': 'Shougo/unite.vim'})
call dein#add('Shougo/unite-help', {'depends': 'Shougo/unite.vim'})
call dein#add('Shougo/junkfile.vim', {'depends': 'Shougo/unite.vim', 'on_cmd': 'JunkfileOpen'}) "{{{
  let g:junkfile#directory = NavimGetCacheDir('junk')
"}}}

"endif "}}}


" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

