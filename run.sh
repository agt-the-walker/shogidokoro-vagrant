#!/bin/bash

set -e

[[ $USER = vagrant ]] || exec vagrant ssh -- /vagrant/run.sh

# The environment variable is necessary to prevent:
#  Error: BadAccess (attempt to access private resource denied)
QT_X11_NO_MITSHM=1 mono Shogidokoro/Shogidokoro.exe
