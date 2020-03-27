# my-nvim-config


 先做两个 py 版本，一个 v2，一个 v3。

```
mkvirtualenv neovim-py2 --python=python2
mkvirtualenv neovim-py2 --python=python3

workon neovim-py2
pip2 install pynvim yapf docformatter

workon neovim-py3
pip3 install pynvim yapf docformatter


./bootstrap.sh
```


## 检查

$ nvim

```
:checkhealth
```
