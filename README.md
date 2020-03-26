# my-nvim-config


 先做两个 py 版本，一个 v2，一个 v3。

```
mkvirtualenv neovim-py2 --python=python2
mkvirtualenv neovim-py2 --python=python3

workon neovim-py2
pip2 install pynvim yapf

workon neovim-py3
pip3 install pynvim yapf


yarn global add neovim
```

#

修改 init.vim 最顶部的 python2 和 python3 为 virtualenvs 的 py 路径。
```
let g:python3_host_prog = '/home/xxx/.virtualenvs/neovim-py3/bin/python3'
let g:python_host_prog = '/home/xxx/.virtualenvs/neovim-py2/bin/python2'
```

## 检查

$ nvim

```
:checkhealth
```
