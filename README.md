# Yocto Sandbox - STM32MP157C-DK2
Begin by installing the necesary packages for building the Yocto project
Ubuntu and Debian:

    $ sudo apt-get install gawk wget git-core diffstat unzip texinfo gcc-multilib \
    build-essential chrpath socat libsdl1.2-dev xterm

Fedora:

    $ sudo dnf install gawk make wget tar bzip2 gzip python unzip perl patch \
    diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
    ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue socat \
    findutils which SDL-devel xterm

OpenSUSE

    $ sudo zypper install python gcc gcc-c++ git chrpath make wget python-xml \
    diffstat makeinfo python-curses patch socat libSDL-devel xterm

CentOS

    $ sudo yum install gawk make wget tar bzip2 gzip python unzip perl patch \
    diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath socat \
    perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue SDL-devel xterm

Retrieve all source:

    $ git submodule update --init --recursive


Source the oe build environment

    $ source poky/oe-init-build-env .


Build the stephendpmurphy image

    $ bitbake stephendpmurphy-image
