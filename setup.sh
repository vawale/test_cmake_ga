#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Elevate permissions
if [ $EUID != 0 ]; then
    sudo "$0" "$@"
    exit $?
fi

source /etc/os-release || exit

osId=$ID
if [[ $VERSION_ID ]]; then
    osId=$osId-$VERSION_ID
fi

export DEBIAN_FRONTEND=noninteractive

function apt-yes {
    apt-get --assume-yes "$@"
}

apt-yes update || exit
apt-yes dist-upgrade || exit

apt-yes install \
    clang \
    clang-format \
    clang-tidy \
    cmake \
    ninja-build ||
    exit $?

