# Python repl

## pyenv

```bash
git clone https://github.com/pyenv/pyenv.git ~/.pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git $(pyenv root)/plugins/pyenv-virtualenv
```

Environments are written into [../zsh/.zshrc](../zsh/.zshrc)

### install py3.7+ on ubuntu17.04-

First you may have to learn to [install your own `openssl`](https://help.dreamhost.com/hc/en-us/articles/360001435926-Installing-OpenSSL-locally-under-your-username)

```bash
CONFIGURE_OPTS="--with-openssl=/home/sy/openssl" LDFLAGS="-L/home/sy/openssl/lib" LD_RUN_PATH="/home/sy/openssl/lib" CPPFLAGS="-I/home/sy/openssl/include" CFLAGS="-I/home/sy/openssl/include" pyenv install -v 3.7.2
```

## pythonrc

Add the location of `.pythonrc.py` to ENV called PYTHONSTARTUP.

e.g. `PYTHONSTARTUP=$HOME/.pythonrc.py`

It will be called when python interactive runs, so it can be used to include useful libraries. e.g.

```python
import re
import requests as q

# or even set proxy
import os

os.environ['https_proxy'] = 'http://127.0.0.1:8123'
```

then you can use it in prompt directly

```python
>>> q.get("https://google.com")
```
