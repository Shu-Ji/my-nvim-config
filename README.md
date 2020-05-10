# my-nvim-config

主要是支持常用的一些语言的 补全、高亮、lint 以及自动 fix。

Python

ES6、CoffeeScript、Pug、Html、CSS(Less/Sass/Scss)、JSX、Vue、lodash、JavaScript

SQL、JSON、QML、Markdown

Dart


很多插件需要 Python 和 NodeJS 才能使用。

## Python


先做两个 py 版本，一个 v2，一个 v3。

```shell
mkvirtualenv neovim-py2 --python=python2
workon neovim-py2
pip install -r pip2-requirements.txt

mkvirtualenv neovim-py3 --python=python3
workon neovim-py3
pip install -r pip3-requirements.txt
```

## NodeJS

TODO

## 安装需要的库等 

大部分是 ale 的 lint 和 autofix 插件。

```shell
./bootstrap.sh
```


## 检查

$ nvim

```
:checkhealth
```
