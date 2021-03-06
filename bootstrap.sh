#!/bin/bash

me=`dirname $0`
cd $me
me=`pwd`

nvim=~/.config/nvim
mkdir -p $nvim

cp $me/init.vim $nvim/init.vim


brew install martindelille/tap/qmlfmt ripgrep
#sudo apt-get install ripgrep

# 下面大部分是用于 ale 的自动 fix 功能。

# neovim
yarn global add neovim

# pug
yarn global add pug-beautifier

# js 补全
yarn global add tern flow-bin

# coffeescript
yarn global add coffeelint

# json
yarn global add fixjson JSV jsonlint

# css/less/sass/scss
yarn global add stylelint less sass-lint

# vue
yarn global add vls

# js/html/css
yarn global add js-beautify


# markdown
yarn global add alex

# js 自动 import
yarn global add import-js


# 安装 vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# 安装所有插件
nvim +PlugInstall +qall
