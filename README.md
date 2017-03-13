# Navim

A full-blown IDE based on Neovim (or Vim) with better navigation.

![Navim](http://taohex.github.io/navim/images/navim.gif)

**Table of Contents**

- [Key Mapping](#key-mapping)
- [Basic Installation](#basic-installation)
- [Advanced Settings](#advanced-settings)
- [Advanced Installation](#advanced-installation)
- [Plugins](#plugins)
- [UI](#ui)
- [Credits](#credits)
- [License](#license)

## Key Mapping

You don't need to remember any key mapping, as navigation bar will show up immediately after the leader key (`<Space>` by default) is pressed.

`<Leader>` default set to `<Space>`, `<LocalLeader>` default set to `,`. For example, `<Space>``s``s` search the word under cursor. As shown below, key mapping is carefully-chosen.

![Navim Key Mapping](http://taohex.github.io/navim/images/navim_key_mapping.png)

More key mapping is listed here.

Key Mapping         | Description
--------------------|------------------------------------------------------------
`<Left>`, `<Right>` | previous buffer, next buffer
`<C-h>`, `<C-l>`    | move to window in the direction of hl
`<C-j>`, `<C-k>`    | move to window in the direction of jk
`<C-w>o`            | maximize or restore current window in split structure
`Q`                 | close windows and delete the buffer (if it is the last buffer window)

## Basic Installation

Basic installation is simple:

```sh
git clone https://github.com/taohex/navim ~/.config/nvim
cd ~/.config/nvim/
git submodule init && git submodule update
```

Make links if you are using Vim:

```sh
mv ~/.vim ~/.vim.backup
mv ~/.vimrc ~/.vimrc.backup
ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
```

Startup vim and [dein](https://github.com/Shougo/dein.vim) will detect and ask you install any missing plugins.

## Advanced Settings

Plugins are nicely organised in layers. There are many ready-to-use layers (javascript, navigation, scm, web, etc.) and you can add your own ones.

Private layers can be added to `private_layers/`. And Private plugins can be added to `private_bundle/`. The content of these two directory is ignored by Git.

It is completely customisable using a `~/.navimrc` file. Just copy `.navimrc.sample` to `~/.navimrc` and modify anything.

After restart Neovim (or Vim), run `call dein#clear_state() || call dein#update()` to apply changes.

### Global Variables

In most instances, modify `g:navim_settings` in `~/.navimrc` should meet your needs.

Key                      | Value                                               | Description
-------------------------|-----------------------------------------------------|-------------------------------------------
`layers`                 | `'c'`, `'completion'`, `'editing'`, ...             | files in `layers/` or `private_layers/`
`additional_plugins`     | `'joshdick/onedark.vim'`, ...                       | github repo
`encoding`               | `'utf-8'`, `'gbk'`, `'latin1'`, ...                 | files in `encoding/`
`bin_dir`                | `'/usr/local/bin'`, ...                             | bin directory for cscope, ctags, ...
`explorer_plugin`        | `'nerdtree'`, `'vimfiler'`                          |
`statusline_plugin`      | `'airline'`, `'lightline'`                          |
`completion_autoselect`  | `1`, `0`                                            | if equals `1`, auto select the best plugin (recommended)
`completion_plugin`      | `'deoplete'`, `'neocomplete'`, `'neocomplcache'`    | only set this when `completion_autoselect` is `0`
`syntaxcheck_autoselect` | `1`, `0`                                            | if equals `1`, auto select the best plugin (recommended)
`syntaxcheck_plugin`     | `'ale'`, `'syntastic'`                              | only set this when `syntaxcheck_autoselect` is `0`
`colorscheme`            | `'solarized'`, `'molokai'`, `'jellybeans'`          | use other colorschemes in `additional_plugins` or `layers` is supported
`powerline_fonts`        | `1`, `0`                                            | requires [font](https://github.com/taohex/font)
`nerd_fonts`             | `1`, `0`                                            | requires [font](https://github.com/taohex/font)

## Advanced Installation

### macOS

YouComplete **only** support Neovim or MacVim.

#### Install Neovim (Recommended)

```sh
pip install --upgrade pip
pip3 install --upgrade pip
pip install --user --upgrade neovim
pip3 install --user --upgrade neovim
brew tap neovim/neovim
brew update
brew reinstall --HEAD neovim
```

Make alias

```sh
alias vi='nvim'
alias vim="nvim"
alias vimdiff="nvim -d"
```

If `<C-h>` does not work in neovim, add these line to `~/.zshrc`

```sh
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```

Execute the `:UpdateRemotePlugins` and restart Neovim.

#### Install MacVim

```sh
brew install macvim --with-luajit --override-system-vim
```

Make alias

```sh
alias vi="mvim -v"
alias vim="mvim -v"
alias vimdiff="mvim -d -v"
```

#### Install GLOBAL

```sh
brew install global
```

#### Quick Compile YouCompleteMe

```sh
cd ~/.config/nvim/bundle/YouCompleteMe
./install.sh --clang-completer --omnisharp-completer
```

Check for `~/.config/nvim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so` and `~/.config/nvim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so`, done

#### Full Compile YouCompleteMe

Try this if quick compile does not work

```sh
cd ~/.config/nvim/bundle/
git clone https://github.com/Valloric/YouCompleteMe
cd YouCompleteMe/
git submodule update --init --recursive
```

Download clang from <http://llvm.org/releases/download.html> to `~/local/src/` and compile ycm_support_libs

```sh
mkdir -p ~/local/src/
cd ~/local/src/
tar xf clang+llvm-3.6.0-x86_64-apple-darwin.tar.xz
mkdir -p ~/local/src/ycm_build/
cd ~/local/src/ycm_build/
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/local/src/clang+llvm-3.6.0-x86_64-apple-darwin . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
```

Check for `~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so` and `~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so`, done

#### Project Configuration

Download <https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py> to your project directory

this can be overridden with `g:navim_settings.completion_autoselect` and `g:navim_settings.completion_plugin`

## Plugins

*	[denite.vim](https://github.com/Shougo/denite.nvim)
*	[unite.vim](https://github.com/Shougo/unite.vim)
*	[lightline.vim](https://github.com/itchyny/lightline.vim)
*	[lightline-buffer](https://github.com/taohex/lightline-buffer)
*	[deoplete](https://github.com/Shougo/deoplete.nvim)
*	[vimfiler.vim](https://github.com/Shougo/vimfiler.vim)
*	[unimpaired](https://github.com/tpope/vim-unimpaired)
*	...

## Fonts

*	[font](https://github.com/taohex/font)

## UI

Command            | Description
-------------------|------------------------------------------------------------
`XtermColorTable`  | show color table
`syntax`           | show syntax highlight

## Credits

I wanted to give special thanks to all of the following projects and people, because I learned a lot and took many ideas and incorporated them into my configuration.

*	[spacemacs](https://github.com/syl20bnr/spacemacs)
*	[shougo](https://github.com/Shougo)
*	[bling](https://github.com/bling/dotvim)
*	...

