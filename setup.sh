#!/bin/bash

set -e

has_update_run=

function Install {
    local package=$1
    if [[ -z "$has_update_run" ]]; then
        apt-get update
        has_update_run=1
    fi
    apt-get install -y $package
}

if [[ $SUDO_USER = vagrant ]]; then

    if [[ ! -f /etc/apt/sources.list.d/mono-xamarin.list ]]; then
        # http://www.mono-project.com/docs/getting-started/install/linux/#debian-ubuntu-and-derivatives
        apt-key adv --keyserver keyserver.ubuntu.com \
                    --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
        echo "deb http://download.mono-project.com/repo/debian wheezy main" \
                >/etc/apt/sources.list.d/mono-xamarin.list
    fi

    which mono >/dev/null || Install mono-complete  # probably overkill
    which unzip >/dev/null || Install unzip

    su - vagrant -c /vagrant/setup.sh

elif [[ $USER = vagrant ]]; then

    if [[ ! -d Shogidokoro ]]; then
        wget -q http://www.geocities.jp/shogidokoro/download/Shogidokoro.zip

        # http://blogs.gnome.org/hrianna.altervista.org/tutorials/unzipping-japanese-encoded-archive/
        UNZIP="-O cp932" unzip Shogidokoro.zip

        rm Shogidokoro.zip
    fi

else
    echo 'Please run "vagrant up" or "vagrant provision" to run this script' >&2
    exit 1
fi
