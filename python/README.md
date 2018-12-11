# Python repl

## usage

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
