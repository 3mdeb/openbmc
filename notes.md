On Fedora

1) install deps

```sh
sudo dnf install git python3 gcc g++ gawk which bzip2 chrpath cpio \
    hostname file diffutils diffstat lz4 wget zstd rpcgen patch
```

2) also needed to install perl module

```sh
sudo dnf install perl-Thread-Queue
```

3) prepare build env

```sh
source setup x11
```

4) run bitbake

```sh
bitbake obmc-phosphor-image
```

Build should start as I make changes to resolve parsing errors, they should be
handled better.
