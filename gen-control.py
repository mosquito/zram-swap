import os
from pathlib import Path
from string import Template


template = Template("""
Package: zram-swap
Version: $version
Depends: python3, libpython3-stdlib
Section: custom
Priority: optional
Architecture: all
Essential: no
Installed-Size: $size
Maintainer: Dmitry Orlov <me@mosquito.su>
Description:
  Easy way to configure swap over zram.
  After installation, the default behavior is to create a `ZRAM`
  disk of the size of half of the available memory.
  Of course, it is worth redefining this.
  You can pass parameters by setting a variable in the /etc/default/zram-swap file:
    ZRAM_SWAP_OPTS="--max-size 1G --algorithm lz4hc --backing-dev /dev/sdc"
  Or using a short version of the keys:
    ZRAM_SWAP_OPTS="-S 1G -A lz4hc -D /dev/sdc"
  All available options available in "zram-swap --help".
  Project distributed under Apache License Version 2.0
""".strip())

files = (
    Path("zram-swap"),
    Path("zram-swap.default"),
    Path("zram-swap.service"),
    Path("zram-swap.preset"),
)


print(template.substitute(
    version=os.environ['VERSION'],
    size=sum(file.stat().st_size for file in files)
))
