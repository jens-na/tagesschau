tagesschau
==========
a small shell script which outputs the link of the latest broadcast of
http://tagesschau.de/.

Depending on the time you start the script you will get the link of
  - Tagesschau
  - Tagesthemen
  - Wochenspiegel
  - etc.

(we ouput the link of the following video format: h264 - large version)

Dependencies
------------
  - curl

Installation
-------------
  - put tagesschau to /usr/local/bin/
  - chmod +x /usr/local/bin/tagesschau

Usage
-----
  - wget `tagesschau` (Download the latest broadcast)
  - mplayer `tagesschau` (Watch the latest broadcast)
