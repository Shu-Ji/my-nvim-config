# my-nvim-config

### python

先做两个 py 版本，一个 v2，一个 v3。

```shell
mkvirtualenv neovim-py2 --python=python2
mkvirtualenv neovim-py2 --python=python3

workon neovim-py2
pip2 install -r pip2-requirements.txt

workon neovim-py3
pip3 install -r pip3-requirements.txt
```

### nodejs

TODO

### 安装需要的库等 

# 大部分是 ale 的 lint 和 autofix 插件。

```shell
./bootstrap.sh
```


### 检查

$ nvim

```
:checkhealth
```
