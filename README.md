# Yocto Sandbox - STM32MP157C-DK2
To begin retrieve all source:
```console
$ git submodule update --init --recursive
```

Source the oe build environment
```console
$ source poky/oe-init-build-env .
```

Build the stephendpmurphy image
```console
$ bitbake stephendpmurphy-image
```