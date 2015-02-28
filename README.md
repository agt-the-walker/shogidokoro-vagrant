# Purpose

This small project shows how to run
[Shogidokoro](http://www.geocities.jp/shogidokoro/) in a Ubuntu VM without
running into dependency hell on your local host.

# Requirements

* [Git](http://git-scm.com/)
* [Vagrant](https://www.vagrantup.com/)
* [X Server](http://www.freedesktop.org/wiki/Software/Xserver/)

# Walkthrough

    $ cd ~/src/git  # or wherever you put your cloned github repos
      git clone https://github.com/agt-the-walker/shogidokoro-vagrant
      cd shogidokoro-vagrant/

    $ vagrant up
      ./run.sh

# Future work

Ensure Shogidokoro also runs in Japanese (instead of displaying garbled 
characters). http://startup-sh.pen.io/ might help here.

Install and configure Shogi engines such as
[GPSshogi](http://gps.tanaka.ecc.u-tokyo.ac.jp/gpsshogi/).

# Credits

* http://shogifrance.fr-bb.com/t1106-shogidokoro-sur-ubuntu-avec-gpsshogi (in
  French)
