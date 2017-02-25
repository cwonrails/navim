" user settings {{{

  if has('win64') || has('win32')
    if filereadable(expand('~\_navimrc'))
      source ~\_navimrc
    endif
  else
    if filereadable(expand('~/.navimrc'))
      source ~/.navimrc
    endif
  endif

" }}}

" before all {{{

  if exists('*BeforeAll')
    call BeforeAll()
  endif

" }}}

" main {{{

  if (v:version < 704)
    echoerr "navim requires Neovim (or Vim 8). INSTALL IT! You'll thank me later!"
    finish
  endif

  if has('win64') || has('win32')
    source ~\AppData\Local\nvim\core\main.vim
  else
    source ~/.config/nvim/core/main.vim
  endif

" }}}

" after all {{{

  if exists('*AfterAll')
    call AfterAll()
  endif

" }}}


" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

