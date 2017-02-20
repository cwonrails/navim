" user settings {{{

  if filereadable(expand('~/.navimrc'))
    source ~/.navimrc
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

  source ~/.config/nvim/core/main.vim

" }}}

" after all {{{

  if exists('*AfterAll')
    call AfterAll()
  endif

" }}}


" vim: fdm=marker ts=2 sts=2 sw=2 fdl=0

