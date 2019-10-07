#

from functools import partial
from collections import defaultdict
import datetime
import json
import sys
import os

try:
    import requests as q
except ImportError:
    pass

sys.ps1 = '> '
sys.ps2 = '  '
