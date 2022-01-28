zram-swap
=========

Easy way to configure swap over zram.

Installation
------------

The first you should install `build-essential` package:

```bash
apt install build-essential
```

And just make it:

```bash
make all
```

And the `deb`-file will be placed in `build/` directory.

Configuration
-------------

After installation, the default behavior is to create a `ZRAM` 
disk of the size of half of the available memory. 
Of course, it is worth redefining this.

You can pass parameters by setting a variable in the 
`/etc/default/zram-swap` file:

```bash
ZRAM_SWAP_OPTS="--max-size 1G --algorithm lz4hc --backing-dev /dev/sdc"
```

Or using a short version of the keys:

```bash
ZRAM_SWAP_OPTS="-S 1G -A lz4hc -D /dev/sdc"
```

All available options available in `--help`:

```
$ zram-swap --help
usage: zram-swap [-h] [--state-file STATE_FILE]
                 [-S MAX_SIZE] [-A ALGORITHM]
                 [-D BACKING_DEV]

options:
  -h, --help            show this help message
                        and exit
  --state-file STATE_FILE
  -S MAX_SIZE, --max-size MAX_SIZE
  -A ALGORITHM, --algorithm ALGORITHM
  -D BACKING_DEV, --backing-dev BACKING_DEV
```

After modification you should restart the systemd service:

```
systemctl restart zram-swap 
```
