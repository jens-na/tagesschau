#!/bin/bash

# Where to write the downloaded video files
DEST_DIR=/tmp

# TagesSchau 20:00
TS20=http://www.tagesschau.de/sendung/tagesschau/index.html
vidurl=$(curl -s "$TS20" | egrep "webl\.h264" | sed 's/.*href=\"//g;s/\">.*//g')

# Get the last part of the URL (ie the part after the last slash)
# and use it as the filename
if [[ "$vidurl" =~ [^/]+$ ]]; then
  file=$BASH_REMATCH
else
  echo "Couldn't retrieve video URL"; exit 1;
fi

# just some type safety for bash :/
declare -i len
declare -i fsize
# Query the header to get the file size of the video
len=$(curl -I $vidurl 2>/dev/null | grep -i "content-length" | cut -d' ' -f2|tr -d '\r\n')
# Get the actual file size if we downloaded this file before
fsize=$(stat -c '%s' "$DEST_DIR/$file" 2>/dev/null)

# If they're equal we have nothing to do, otherwise download the file (again)
if (( fsize != len )) ; then
  # Be quiet for cron and overwrite file
  wget -q $vidurl -O $DEST_DIR/$file
fi
