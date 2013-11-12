#!/bin/bash

#LAST_VIDEO=$(curl -s http://www.tagesschau.de | egrep ".*sendung/ts.*" | head -n 1 | sed 's/.*href=\"/http:\/\/www.tagesschau.de/g;s/\">//g')

# TagesSchau 20:00
TS20=http://www.tagesschau.de/sendung/tagesschau/index.html
vidurl=$(curl -s "$TS20" | egrep "webl\.h264" | sed 's/.*href=\"//g;s/\">.*//g')

#file=$(expr match "$vidurl" '[^/]+$')

if [[ "$vidurl" =~ [^/]+$ ]]; then
  file=$BASH_REMATCH
else
  echo "Couldn't retrieve video URL"; exit 1;
fi

declare -i len
declare -i fsize
# Query the header to get the file size of the video
len=$(curl -I $vidurl 2>/dev/null | grep -i "content-length" | cut -d' ' -f2|tr -d '\r\n')
fsize=$(stat -c '%s' "$file" 2>/dev/null)

if (( fsize != len )) ; then
  # Be quiet for cron and overwrite file
  wget -q $vidurl -O $file
fi
