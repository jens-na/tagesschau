tagesschau
==========
a small shell script which outputs the link of the latest broadcast of Tagesschau.

video format: h264 - large version

Dependencies
------------
  - curl

Installation
-------------
  - put tagesschau to <tt>/usr/local/bin/</tt>
  - <tt>chmod +x /usr/local/bin/tagesschau</tt>

AUR Package: https://aur.archlinux.org/packages/tagesschau-git/

Usage
-----
  - <tt>wget $(tagesschau)</tt> # (Download the latest broadcast)
  - <tt>mplayer $(tagesschau)</tt> # (Watch the latest broadcast)
