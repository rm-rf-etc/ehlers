#!/usr/bin/env python3
import setuptools
import site
from numpy.distutils.core import setup, Extension

site.ENABLE_USER_SITE = True

setup(
    ext_modules=[
        Extension(name="ehlers", sources=["ehlers.f90"]),
    ]
)
