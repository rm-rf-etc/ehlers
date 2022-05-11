#!/usr/bin/env python

# %%
import numpy as np
import math
from ehlers import smooth

# %%
a = np.array([1,2,3,4,5,4,3,2,1,2,3,4,5,4,3,2,1])
b = smooth.laguerre(a,1)
c = [
    1,
    1.16666667,
    1.66666667,
    2.5,
    3.5,
    4.16666667,
    4.16666667,
    3.5,
    2.5,
    1.83333333,
    1.83333333,
    2.5,
    3.5,
    4.16666667,
    4.16666667,
    3.5,
    2.5]

for i in range(0, len(b)):
    assert(math.isclose(b[i], c[i], abs_tol=0.00000001))
# %%
