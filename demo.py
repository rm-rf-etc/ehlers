#!/usr/bin/env python

# %%
import numpy as np
import importlib
import ehlers
importlib.reload(ehlers)
from ehlers import smooth

# %%
a = np.array([1,2,3,4,5,4,3,2,1,2,3,4,5,4,3,2,1])
b = smooth.laguerre(a,1)
print(b)

# %%
