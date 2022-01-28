import os
from pathlib import Path
from string import Template


template = Template("""
Package: zram-swap
Version: $version
Depends: python3, python3-stdlib
Section: custom
Priority: optional
Architecture: all
Essential: no
Installed-Size: $size
Maintainer: Dmitry Orlov <me@mosquito.su>
Description: Easy way to configure swap over zram
""".strip())

files = (
    Path("zram-swap"),
    Path("zram-swap.default"),
    Path("zram-swap.service"),
)


print(template.substitute(
    version=os.environ['VERSION'],
    size=sum(file.stat().st_size for file in files)
))
