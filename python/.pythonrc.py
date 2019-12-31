#

from functools import partial
from collections import defaultdict
import datetime
import json
import sys
import operator
import os
import time

try:
    import requests as q
except ImportError:
    pass

sys.ps1 = '> '
sys.ps2 = '  '
