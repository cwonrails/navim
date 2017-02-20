# Navim

A full-blown IDE based on Neovim (or Vim 8) with better navigation.

![Navim](http://taohex.github.io/navim/images/navim.gif)

**Table of Contents**

- [Keymapping](#keymapping)
- [Basic Installation](#basic-installation)
- [Advanced Settings](#advanced-settings)
- [Advanced Installation](#advanced-installation)
- [Some Useful Plugins](#some-useful-plugins)
- [UI](#ui)
- [Credits](#credits)
- [License](#license)

## Keymapping

You don't need to remember any keymapping, because navigation guides will show up immediately after pressing the leader key (`<Space>` by default).

`<Leader>` default set to `<Space>`, `<LocalLeader>` default set to `,`.

![Navim Keymapping](http://taohex.github.io/navim/images/navim_keymapping.png)

As shown, keymapping is carefully-chosen. More keymapping is listed here.

Keymapping          | Description
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

Make links if you are using Vim 8:

```sh
mv ~/.vim ~/.vim.backup
mv ~/.vimrc ~/.vimrc.backup
ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/init.vim ~/.vimrc
```

Startup vim and [dein](https://github.com/Shougo/dein.vim) will detect and ask you install any missing plugins.

## Advanced Settings

It is completely customisable using a `~/.navimrc` file. Just copy `.navimrc.sample` to `~/.navimrc` and modify anything.

After restart Neovim (or Vim 8), run `call dein#clear_state() || call dein#update()` to apply changes.

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
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer --omnisharp-completer
```

Check for `~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so` and `~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so`, done

#### Full Compile YouCompleteMe

Try this if quick compile does not work

```sh
cd ~/.vim/bundle/
git clone https://github.com/Valloric/YouCompleteMe
cd YouCompleteMe/
git submodule update --init --recursive
```

Download clang from <http://llvm.org/releases/download.html> to `~/src/` and compile ycm_support_libs

```sh
mkdir -p ~/src/
cd ~/src/
tar xf clang+llvm-3.6.0-x86_64-apple-darwin.tar.xz
mkdir -p ~/src/ycm_build/
cd ~/src/ycm_build/
cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=~/src/clang+llvm-3.6.0-x86_64-apple-darwin . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
```

Check for `~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_client_support.so` and `~/.vim/bundle/YouCompleteMe/third_party/ycmd/ycm_core.so`, done

#### Project Configuration

Download <https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py> to your project directory

this can be overridden with `g:navim_settings.completion_autoselect` and `g:navim_settings.completion_plugin`

## Some Useful Plugins

### [unite.vim](https://github.com/Shougo/unite.vim)
*	this is an extremely powerful plugin that lets you build up lists from arbitrary sources

### [lightline.vim](https://github.com/itchyny/lightline.vim)
*	a light and configurable statusline/tabline

### [lightline-buffer](https://github.com/taohex/lightline-buffer)
*	show tab info and buffer info in tabline

### [vimfiler.vim](https://github.com/Shougo/vimfiler.vim)
*	powerful file explorer

### [unimpaired](https://github.com/tpope/vim-unimpaired)
*	many additional bracket `[]` maps
*	`<C-up>` to move lines up
*	`<C-down>` to move lines down

### Recommended Fonts

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
*	[janus](https://github.com/carlhuda/janus)
*	[spf13](https://github.com/spf13/spf13-vim)
*	[yadr](http://skwp.github.com/dotfiles/)
*	[astrails](https://github.com/astrails/dotvim)
*	[tpope](https://github.com/tpope)
*	[scrooloose](https://github.com/scrooloose)
*	[lokaltog](https://github.com/Lokaltog)
*	[sjl](https://github.com/sjl)
*	[terryma](https://github.com/terryma)

