tagesschau
==========
a small shell script which outputs the link of the latest broadcast of
http://tagesschau.de/.

Depending on the time you start the script you will get the link of
  - Tagesschau
  - Tagesthemen
  - Wochenspiegel
  - etc.

video format: h264 - large version

Dependencies
------------
  - curl

Installation
-------------
  - put tagesschau to <tt>/usr/local/bin/</tt>
  - <tt>chmod +x /usr/local/bin/tagesschau</tt>

Usage
-----
  - <tt>wget $(tagesschau)</tt> # (Download the latest broadcast)
  - <tt>mplayer $(tagesschau)</tt> # (Watch the latest broadcast)
